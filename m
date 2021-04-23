Return-Path: <SRS0=6KHC=JU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F321CC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 12:20:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFDD61450
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 12:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFDD61450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC6E843D8;
	Fri, 23 Apr 2021 12:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1EkUj3TTs2J; Fri, 23 Apr 2021 12:20:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17918843D0;
	Fri, 23 Apr 2021 12:20:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB091C000E;
	Fri, 23 Apr 2021 12:20:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E8B7C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 12:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F12BD607AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 12:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7dLkpWnJ61f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 12:20:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B829F60661
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 12:20:38 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c17so33978341pfn.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 05:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=puoDTfvhjQbGo57jYiB9OwNTmwysMKQM/yfSRh13jiY=;
 b=K4o+6klSACs+EiTu/tfdFgOes+iAVN+A87ScCR6rXxHTlTAay8pYH15MymOhuiVnyx
 NrqsE6WZ8tSjDlvFalUGG3xzNov2d4qak1qoI8oVzE2bq1fSyzKFnSYYAsS3BDQf7SJm
 cL1u+ORmm48UwmDkOqPChLF5R9fTGUFPwnXWlzGVbi0w3qdFFeppKCiN7DbJL0iH5G6D
 mtQ30t/Gj8jn4kSR6ZP/tsnciWgeHoUgvc+LGi8Q4pic1lRcnj1STgsJrBo+h2t4smUX
 VGj0dAQbKMJNfDWlhFqUF7Mr0cDfWxULjL4qHTKIqE7uMVhADXtzSj6fMwkJSmaND04M
 hgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=puoDTfvhjQbGo57jYiB9OwNTmwysMKQM/yfSRh13jiY=;
 b=bQj2NHVSLzTthy7wH+TBWUlP7jKZ7PRFzGFIKNgr0Wchk5QXYGO+jiD1hCk+gnPhHJ
 SmmLv3SowJssKZ886q6g+RgcoyBfRzKowrjLQoP9WWNy0aYfmYDV9xg0iarkru9Hfpn4
 8gI0xVrMC4t0urqKYKqg75oFNTPECYHD1PFbRWOJb3VNBRqI4RnkT7kpqb82W4qgPQw2
 iCX5PFvduuUfKlLnM4LI/Ss5oJSOvCt5AXT6URgZv30Kp3yOwc5c4Lt2K3rjBSylEV/I
 o9O2kKNiPgWQ4Bd8HnKz9EBT0rvqkK3HnaCmuWzsp1KIGdb4+hWOtIg0Ohl4kuGyKHBL
 g9lQ==
X-Gm-Message-State: AOAM532MqKmH55xLq6m0C5D5OI1HDpapDscNevQbbgYONTahCFo2v8UL
 PcJKlA96Dcqdngw/WrHkmqQ=
X-Google-Smtp-Source: ABdhPJx0qTp2K7ITbWxQKB536T+HSeYJvu1E9vWhXtepDdq0Qa2thhMZc6Zmxd6wd0icTFHdZxTUYg==
X-Received: by 2002:a63:231c:: with SMTP id j28mr3456276pgj.165.1619180438011; 
 Fri, 23 Apr 2021 05:20:38 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:d9c1:8320:7f58:f75a?
 ([2405:201:600d:a089:d9c1:8320:7f58:f75a])
 by smtp.gmail.com with ESMTPSA id gw19sm4966851pjb.4.2021.04.23.05.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 05:20:37 -0700 (PDT)
Subject: Re: [RFC] scripts: kernel-doc: reduce repeated regex expressions into
 variables
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210422191839.6119-1-yashsri421@gmail.com>
 <CAKXUXMx9q57cWXkcezKKo-uuh21Sd-Si9M9KydzFEMQ0ELYEng@mail.gmail.com>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <1101eeb0-306f-dbea-8819-8bddd80d361c@gmail.com>
Date: Fri, 23 Apr 2021 17:50:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx9q57cWXkcezKKo-uuh21Sd-Si9M9KydzFEMQ0ELYEng@mail.gmail.com>
Content-Language: en-US
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 23/4/21 1:03 am, Lukas Bulwahn wrote:
> Aditya Srivastava <yashsri421@gmail.com> schrieb am Do., 22. Apr. 2021,
> 21:18:
> 
>> There are some regex expressions in the kernel-doc script, which are used
>> repeatedly in the script.
>>
>> Reduce such expressions into variables, which can be used everywhere.
>>
>> A quick manual check found that no errors and warnings were added/removed
>> in this process.
>>
>> Suggested-by: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/kernel-doc | 89 ++++++++++++++++++++++++++--------------------
>>  1 file changed, 50 insertions(+), 39 deletions(-)
>>
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index 2a85d34fdcd0..579c9fdd275f 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -406,6 +406,7 @@ my $doc_inline_sect =
>> '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
>>  my $doc_inline_end = '^\s*\*/\s*$';
>>  my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
>>  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
>> +my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
>>
>>  my %parameterdescs;
>>  my %parameterdesc_start_lines;
>> @@ -694,7 +695,7 @@ sub output_function_man(%) {
>>             $post = ");";
>>         }
>>         $type = $args{'parametertypes'}{$parameter};
>> -       if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
>> +       if ($type =~ m/$pointer_function/) {
>>             # pointer-to-function
>>             print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" .
>> $post . "\"\n";
>>         } else {
>> @@ -974,7 +975,7 @@ sub output_function_rst(%) {
>>         $count++;
>>         $type = $args{'parametertypes'}{$parameter};
>>
>> -       if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
>> +       if ($type =~ m/$pointer_function/) {
>>             # pointer-to-function
>>             print $1 . $parameter . ") (" . $2 . ")";
>>         } else {
>> @@ -1210,8 +1211,14 @@ sub dump_struct($$) {
>>      my $decl_type;
>>      my $members;
>>      my $type = qr{struct|union};
>> +    my $packed = qr{__packed};
>> +    my $aligned = qr{__aligned};
>> +    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
>> +    my $cacheline_aligned = qr{____cacheline_aligned};
>> +    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
>>      # For capturing struct/union definition body, i.e.
>> "{members*}qualifiers*"
>> -    my $definition_body =
>> qr{\{(.*)\}(?:\s*(?:__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*};
>> +    my $definition_body =
>> qr{\{(.*)\}(?:\s*(?:$packed|$aligned|$cacheline_aligned_in_smp|$cacheline_aligned|$attribute))*};
>> +    my $struct_members =
>> qr{($type)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;};
>>
>>      if ($x =~ /($type)\s+(\w+)\s*$definition_body/) {
>>         $decl_type = $1;
>> @@ -1235,27 +1242,27 @@ sub dump_struct($$) {
>>         # strip comments:
>>         $members =~ s/\/\*.*?\*\///gos;
>>         # strip attributes
>> -       $members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
>> -       $members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
>> -       $members =~ s/\s*__packed\s*/ /gos;
>> +       $members =~ s/\s*$attribute/ /gi;
>> +       $members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;
>> +       $members =~ s/\s*$packed\s*/ /gos;
>>         $members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
>> -       $members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
>> -       $members =~ s/\s*____cacheline_aligned/ /gos;
>> +       $members =~ s/\s*$cacheline_aligned_in_smp/ /gos;
>> +       $members =~ s/\s*$cacheline_aligned/ /gos;
>>
>> +       my $args = qr{([^,)]+)};
>>         # replace DECLARE_BITMAP
>>         $members =~
>> s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1,
>> __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
>> -       $members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned
>> long $1\[BITS_TO_LONGS($2)\]/gos;
>> +       $members =~ s/DECLARE_BITMAP\s*\($args,\s*$args\)/unsigned long
>> $1\[BITS_TO_LONGS($2)\]/gos;
>>         # replace DECLARE_HASHTABLE
>> -       $members =~
>> s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2)
>> - 1)\]/gos;
>> +       $members =~ s/DECLARE_HASHTABLE\s*\($args,\s*$args\)/unsigned long
>> $1\[1 << (($2) - 1)\]/gos;
>>         # replace DECLARE_KFIFO
>> -       $members =~
>> s/DECLARE_KFIFO\s*\(([^,)]+),\s*([^,)]+),\s*([^,)]+)\)/$2 \*$1/gos;
>> +       $members =~ s/DECLARE_KFIFO\s*\($args,\s*$args,\s*$args\)/$2
>> \*$1/gos;
>>         # replace DECLARE_KFIFO_PTR
>> -       $members =~ s/DECLARE_KFIFO_PTR\s*\(([^,)]+),\s*([^,)]+)\)/$2
>> \*$1/gos;
>> -
>> +       $members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
>>         my $declaration = $members;
>>
>>         # Split nested struct/union elements as newer ones
>> -       while ($members =~
>> m/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/) {
>> +       while ($members =~ m/$struct_members/) {
>>                 my $newmember;
>>                 my $maintype = $1;
>>                 my $ids = $4;
>> @@ -1315,7 +1322,7 @@ sub dump_struct($$) {
>>                                 }
>>                         }
>>                 }
>> -               $members =~
>> s/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$newmember/;
>> +               $members =~ s/$struct_members/$newmember/;
>>         }
>>
>>         # Ignore other nested elements, like enums
>> @@ -1555,8 +1562,9 @@ sub create_parameterlist($$$$) {
>>      my $param;
>>
>>      # temporarily replace commas inside function pointer definition
>> -    while ($args =~ /(\([^\),]+),/) {
>> -       $args =~ s/(\([^\),]+),/$1#/g;
>> +    my $arg_expr = qr{\([^\),]+};
>> +    while ($args =~ /$arg_expr,/) {
>> +       $args =~ s/($arg_expr),/$1#/g;
>>      }
>>
>>      foreach my $arg (split($splitter, $args)) {
>> @@ -1808,8 +1816,11 @@ sub dump_function($$) {
>>      # - parport_register_device (function pointer parameters)
>>      # - atomic_set (macro)
>>      # - pci_match_device, __copy_to_user (long return type)
>> +    my $name = qr{[a-zA-Z0-9_~:]+};
>> +    my $prototype_end1 = qr{\(([^\(]*)\)};
>> +    my $prototype_end2 = qr{\(([^\{]*)\)};
>>
> 
> Why do you need end1 and end2 here?
> 

Thanks for pointing out, Lukas. I am looking into the possibility of
combining these expressions, and testing against the files.
Please let me know if there are any more improvements possible :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
