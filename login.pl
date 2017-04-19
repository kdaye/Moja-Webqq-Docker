#!/usr/bin/perl
use Mojo::Webqq;

my $client=Mojo::Webqq->new(
mode        => "callme",
log_encoding=>"utf8",
ua_debug    =>  0,
log_level   => "info",
login_type  =>  "qrlogin",
);

$client->load(["Translation","GroupManage",]);

$client->load("SmartReply",data=>{
apikey=>"703acb30c358452bb54d1d6e6e5060ab",
is_need_at=>0,
keyword=>[qw(XIAOV 小薇)],
});

$client->load("KnowledgeBase",data=>{file=>"/knowledge/KnowledgeBase.txt"});

$client->load("PostQRcode",data=>{
smtp=>'smtp.qq.com',
port=>'465',
from=>'ID@qq.com',
to=>'ID@qq.com',
user=>'ID',
pass=>'PASSWORD',
tls=>1,
});

$client->run();
