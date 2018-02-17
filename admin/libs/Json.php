<?php

namespace AtomparkApi;

/**
 * Json helper.
 *
 */
class Json {
    
    public static function pretty_print( $json , $k=0) {

        $result = '';
        $level = 0;
        $in_quotes = false;
        $in_escape = false;
        $ends_line_level = NULL;
        $json_length = strlen( $json );

        for( $i = 0; $i < $json_length; $i++ )
        {
            $char = $json[$i];
            $new_line_level = NULL;
            $post = "";
            if ( $ends_line_level !== NULL ) 
            {
                $new_line_level = $ends_line_level;
                $ends_line_level = NULL;
            }
            if ( $in_escape ) 
            {
                $in_escape = false;
            }
            else if( $char === '"' ) 
            {
                $in_quotes = !$in_quotes;
            } 
            else if( ! $in_quotes ) 
            {
                switch( $char ) 
                {
                    case '}': case ']':
                        $level--;
                        $ends_line_level = NULL;
                        $new_line_level = $level;
                        break;

                    case '{': case '[':
                        $level++;
                    case ',':
                        $ends_line_level = $level;
                        break;

                    case ':':
                        $post = " ";
                        break;

                    case " ": case "\t": case "\n": case "\r":
                        $char = "";
                        $ends_line_level = $new_line_level;
                        $new_line_level = NULL;
                        break;
                }
            } 
            else if ( $char === '\\' ) 
            {
                $in_escape = true;
            }
            if( $new_line_level !== NULL ) 
            {
                $result .= "\n".str_repeat( "\t", $new_line_level );
            }
            $result .= $char.$post;
        }

        return $result;
    }

    public static function econding($jsonObj, $from, $to) {
        if ($from == $to)
            return $jsonObj;

        $type = gettype($jsonObj);
        switch ($type) {
            case 'object':
                $out = new \StdClass;
                break;
            case 'string':
                $out = '';
                break;
            case 'array':
                $out = array();
                break;
        }
        if (is_object($jsonObj) 
            || is_array($jsonObj)) {
            foreach ($jsonObj as $i => $v) {
                $i = iconv($from, $to, $i);
                if (is_object($v) 
                    || is_array($v)) {
                    if ($type == 'object') {
                        $out->{$i} = self::econding($v, $from, $to);
                    } else {
                        $out[$i] = self::econding($v, $from, $to);
                    }
                } else {
                    // string iconv ( string $in_charset , string $out_charset , string $str )
                    // string mb_convert_encoding ( string $str , string $to_encoding [, mixed $from_encoding = mb_internal_encoding() ] )
                    // $v = mb_convert_encoding($v, $to, $from);
                    if ($type == 'object') {
                        $out->{$i} = iconv($from, $to, $v);
                    } else {
                        $out[$i] = iconv($from, $to, $v);
                    }
                }
            }
        } else {
            $out = iconv($from, $to, $jsonObj);
        }
        return $out;            
    }
    
    public function unicode_decode($string, $encode) {
        return preg_replace_callback('/\\\\u([0-9a-fA-F]{4})/', function ($match) use ($encode) {
            // UTF-8//IGNORE ISO-8859-15 ASCII
            return mb_convert_encoding(pack('H*', $match[1]), $encode, 'UCS-2BE'); // 'UTF-16BE'
        }, $string);         
    }

}