//
//  SDKErrorCodeDefine.h
//  SDKLibrary
//
//  Created by  on 12/14/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#ifndef SDKErrorCodeDefine_h
#define SDKErrorCodeDefine_h
#define STATUS_CODE_StatusCodeDefine_h
#define STATUS_CODE_OK                         0
#define STATUS_CODE_UNSUPPORTED_PROTOCOL       1 /* */
#define STATUS_CODE_FAILED_INIT                2  /**/
#define STATUS_CODE_URL_MALFORMAT              3  /**/
#define STATUS_CODE_NOT_BUILT_IN               4 /* - [was obsoleted in August 2007 for
7.17.0  reused in April 2011 for 7.21.5]  */
#define STATUS_CODE_COULDNT_RESOLVE_PROXY      5  /**/
#define STATUS_CODE_COULDNT_RESOLVE_HOST       6  /**/
#define STATUS_CODE_COULDNT_CONNECT            7  /**/
#define STATUS_CODE_FTP_WEIRD_SERVER_REPLY     8  /**/
#define STATUS_CODE_REMOTE_ACCESS_DENIED       9 /*a service was denied by the server
due to lack of access - when login fails
this is not returned.  */
#define STATUS_CODE_FTP_ACCEPT_FAILED          10 /* - [was obsoleted in April 2006 for
7.15.4  reused in Dec 2011 for 7.24.0] */
#define STATUS_CODE_FTP_WEIRD_PASS_REPLY       11  /**/
#define STATUS_CODE_FTP_ACCEPT_TIMEOUT         12 /* - timeout occurred accepting server
[was obsoleted in August 2007 for 7.17.0
reused in Dec 2011 for 7.24.0] */
#define STATUS_CODE_FTP_WEIRD_PASV_REPLY       13  /**/
#define STATUS_CODE_FTP_WEIRD_227_FORMAT       14  /**/
#define STATUS_CODE_FTP_CANT_GET_HOST          15  /**/
#define STATUS_CODE_HTTP2                      16 /* - A problem in the http2 framing layer.
[was obsoleted in August 2007 for 7.17.0
reused in July 2014 for 7.38.0]  */
#define STATUS_CODE_FTP_COULDNT_SET_TYPE       17  /**/
#define STATUS_CODE_PARTIAL_FILE               18  /**/
#define STATUS_CODE_FTP_COULDNT_RETR_FILE      19  /**/
#define STATUS_CODE_OBSOLETE20                 20 /* - NOT USED  */
#define STATUS_CODE_QUOTE_ERROR                21 /* - quote command failure  */
#define STATUS_CODE_HTTP_RETURNED_ERROR        22  /**/
#define STATUS_CODE_WRITE_ERROR                23  /**/
#define STATUS_CODE_OBSOLETE24                 24 /* - NOT USED  */
#define STATUS_CODE_UPLOAD_FAILED              25 /* - failed upload "command"  */
#define STATUS_CODE_READ_ERROR                 26 /* - couldn't open/read from file  */
#define STATUS_CODE_OUT_OF_MEMORY              27  /*
Note: #define STATUS_CODE_OUT_OF_MEMORY may sometimes indicate a conversion error
instead of a memory allocation error if CURL_DOES_CONVERSIONS
is defined
*/
#define STATUS_CODE_OPERATION_TIMEDOUT         28 /* - the timeout time was reached  */
#define STATUS_CODE_OBSOLETE29                 29 /* - NOT USED  */
#define STATUS_CODE_FTP_PORT_FAILED            30 /* - FTP PORT operation failed  */
#define STATUS_CODE_FTP_COULDNT_USE_REST       31 /* - the REST command failed  */
#define STATUS_CODE_OBSOLETE32                 32 /* - NOT USED  */
#define STATUS_CODE_RANGE_ERROR                33 /* - RANGE "command" didn't work  */
#define STATUS_CODE_HTTP_POST_ERROR            34  /**/
#define STATUS_CODE_SSL_CONNECT_ERROR          35 /* - wrong when connecting with SSL  */
#define STATUS_CODE_BAD_DOWNLOAD_RESUME        36 /* - couldn't resume download  */
#define STATUS_CODE_FILE_COULDNT_READ_FILE     37  /**/
#define STATUS_CODE_LDAP_CANNOT_BIND           38  /**/
#define STATUS_CODE_LDAP_SEARCH_FAILED         39  /**/
#define STATUS_CODE_OBSOLETE40                 40 /* - NOT USED  */
#define STATUS_CODE_FUNCTION_NOT_FOUND         41  /**/
#define STATUS_CODE_ABORTED_BY_CALLBACK        42  /**/
#define STATUS_CODE_BAD_FUNCTION_ARGUMENT      43  /**/
#define STATUS_CODE_OBSOLETE44                 44 /* - NOT USED  */
#define STATUS_CODE_INTERFACE_FAILED           45  /*- CURLOPT_INTERFACE failed  */
#define STATUS_CODE_OBSOLETE46                 46  /*- NOT USED  */
#define STATUS_CODE_TOO_MANY_REDIRECTS         47  /*- catch endless re -direct loops  */
#define STATUS_CODE_UNKNOWN_OPTION             48  /*- User specified an unknown option  */
#define STATUS_CODE_TELNET_OPTION_SYNTAX       49  /*- Malformed telnet option  */
#define STATUS_CODE_OBSOLETE50                 50  /*- NOT USED  */
#define STATUS_CODE_PEER_FAILED_VERIFICATION    51  /*- peer's certificate or fingerprint
wasn't verified fine  */
#define STATUS_CODE_GOT_NOTHING                52  /*- when this is a specific error  */
#define STATUS_CODE_SSL_ENGINE_NOTFOUND        53  /*- SSL crypto engine not found  */
#define STATUS_CODE_SSL_ENGINE_SETFAILED       54  /*- can not set SSL crypto engine as
default  */
#define STATUS_CODE_SEND_ERROR                 55  /*- failed sending network data  */
#define STATUS_CODE_RECV_ERROR                 56  /*- failure in receiving network data  */
#define STATUS_CODE_OBSOLETE57                 57  /*- NOT IN USE  */
#define STATUS_CODE_SSL_CERTPROBLEM            58  /*- problem with the local certificate  */
#define STATUS_CODE_SSL_CIPHER                 59  /*- couldn't use specified cipher  */
#define STATUS_CODE_SSL_CACERT                 60  /*- problem with the CA cert (path?)  */
#define STATUS_CODE_BAD_CONTENT_ENCODING       61  /*- Unrecognized/bad encoding  */
#define STATUS_CODE_LDAP_INVALID_URL           62  /*- Invalid LDAP URL  */
#define STATUS_CODE_FILESIZE_EXCEEDED          63  /*- Maximum file size exceeded  */
#define STATUS_CODE_USE_SSL_FAILED             64  /*- Requested FTP SSL level failed  */
#define STATUS_CODE_SEND_FAIL_REWIND           65  /*- Sending the data requires a rewind
that failed  */
#define STATUS_CODE_SSL_ENGINE_INITFAILED      66  /*- failed to initialise ENGINE  */
#define STATUS_CODE_LOGIN_DENIED               67  /*- user  password or similar was not
accepted and we failed to login  */
#define STATUS_CODE_TFTP_NOTFOUND              68  /*- file not found on server  */
#define STATUS_CODE_TFTP_PERM                  69  /*- permission problem on server  */
#define STATUS_CODE_REMOTE_DISK_FULL           70  /*- out of disk space on server  */
#define STATUS_CODE_TFTP_ILLEGAL               71  /*- Illegal TFTP operation  */
#define STATUS_CODE_TFTP_UNKNOWNID             72  /*- Unknown transfer ID  */
#define STATUS_CODE_REMOTE_FILE_EXISTS         73  /*- File already exists  */
#define STATUS_CODE_TFTP_NOSUCHUSER            74  /*- No such user  */
#define STATUS_CODE_CONV_FAILED                75  /*- conversion failed  */
#define STATUS_CODE_CONV_REQD                  76  /*- caller must register conversion
callbacks using curl_easy_setopt options
CURLOPT_CONV_FROM_NETWORK_FUNCTION
CURLOPT_CONV_TO_NETWORK_FUNCTION  and
CURLOPT_CONV_FROM_UTF8_FUNCTION  */
#define STATUS_CODE_SSL_CACERT_BADFILE         77  /*- could not load CACERT file  missing
or wrong format  */
#define STATUS_CODE_REMOTE_FILE_NOT_FOUND      78  /*- remote file not found  */
#define STATUS_CODE_SSH                        79  /*- error from the SSH layer  somewhat
generic so the error message will be of
interest when this has happened  */

#define STATUS_CODE_SSL_SHUTDOWN_FAILED        80  /*- Failed to shut down the SSL
connection  */
#define STATUS_CODE_AGAIN                      81  /*- socket is not ready for send/recv
wait till it's ready and try again (Added
in 7.18.2)  */
#define STATUS_CODE_SSL_CRL_BADFILE            82  /*- could not load CRL file  missing or
wrong format (Added in 7.19.0)  */
#define STATUS_CODE_SSL_ISSUER_ERROR           83  /*- Issuer check failed.  (Added in
7.19.0)  */
#define STATUS_CODE_FTP_PRET_FAILED            84  /*- a PRET command failed  */
#define STATUS_CODE_RTSP_CSEQ_ERROR            85  /*- mismatch of RTSP CSeq numbers  */
#define STATUS_CODE_RTSP_SESSION_ERROR         86  /*- mismatch of RTSP Session Ids  */
#define STATUS_CODE_FTP_BAD_FILE_LIST          87  /*- unable to parse FTP file list  */
#define STATUS_CODE_CHUNK_FAILED               88  /*- chunk callback reported error  */
#define STATUS_CODE_NO_CONNECTION_AVAILABLE    89  /*- No connection available  the
session will be queued  */
#define STATUS_CODE_SSL_PINNEDPUBKEYNOTMATCH    90  /*- specified pinned public key did not
match  */
#define STATUS_CODE_SSL_INVALIDCERTSTATUS      91  /*- invalid certificate status  */

#define STATUS_CODE_EMPTY_DATA     91  /*- invalid certificate status  */

#endif /* SDKErrorCodeDefine_h */
