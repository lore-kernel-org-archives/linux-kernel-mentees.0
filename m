Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01C9C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 09:45:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACB560E97
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 09:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ACB560E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E42A40146;
	Mon,  2 Aug 2021 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qS94DOEih2zh; Mon,  2 Aug 2021 09:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 88018400BD;
	Mon,  2 Aug 2021 09:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59F91C0010;
	Mon,  2 Aug 2021 09:45:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41190C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 192B1827FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5QDzymTJ1AO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:45:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3003827B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:45:08 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id az7so15998797qkb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ObytMDBKshUgi+CFuFk5rAENwsNLKKMNjwo8Ys1w+tc=;
 b=BQ/igRN7mkWgfJLCO+fjASlBlGPCffNlpGN54gfD8p1CFC+ptGOTg4Roj/NtP5d9dg
 2C87aHn5rUb4gJ17Rk1WlCtyHCFgXCdOrYtUBbJV2xL5i/e6FUfQkF7UkLhZF2Yjsbrs
 0uZr3ZLuaDUcdoy37sd/zcl1j1Xsik44mFLjF72EQGkcqXw8iO1wGu20XWYIaAGrGjUf
 6zegSL04TTQjXJXOdkyhgI8wSYJoeXJg0HHa/C+GOkhEVOu6uEIOzV37YJPYoJcbJygb
 eg27GVP7QnhEEpO5onvOg6TNvlO+PRu3atG7WU1RTRydNT2DgnkSKqtvb//lSWyGlF6O
 qwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObytMDBKshUgi+CFuFk5rAENwsNLKKMNjwo8Ys1w+tc=;
 b=Wgfol7AR9ob6K1VUKb0jBQm11z/GdpPxJBX7XpiWnghAAZVWcUviD/YALQfp8Gjn27
 38LdJO1Grqpq730bHx5hNrr++pJ3BGNbicY3SqnRmFe9MU+D66wM0Z7KdWFRQn0ggjwU
 VKpCWqmMY2c3k7Eq52hlRhdt1mz2DFKg/JghFzEgd4fRFha/guh/dwIPzh18shbEQv1q
 XftPMkNSP7ZHGjKns3zSdBPy9JVWoxiAY9cpYk/ox73rLzB0ZitwhmUVDGobhkdLqf+r
 /ICtuAVrfxP0O7blFl6fvlN1mHXeJzEdgkYSF3D69WYx1dIPZGSVV33jsDYUTwDWjV0L
 ia2Q==
X-Gm-Message-State: AOAM533IDxomPjM+ro5Br9mCN5L3+aHpcpvWA0Svn5+D64iEdZUJ+jaZ
 Du/BpBLFgDQGEushUnoOA8SejMwNTMzsDOgb7mw=
X-Google-Smtp-Source: ABdhPJxT7F0fXdu5k2/bg/GXWstH/yiZ5to/47xSu+iIkcHRqy8TsAOmldeUfgLQxOmqXeX0Y5joRWCvVuNhxRktvNI=
X-Received: by 2002:a37:634e:: with SMTP id x75mr13976868qkb.35.1627897506880; 
 Mon, 02 Aug 2021 02:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
 <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
In-Reply-To: <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Mon, 2 Aug 2021 15:14:53 +0530
Message-ID: <CAMqN5U4JBC20E=k8ssEgiohZ+8LDv+iPQdOMKYLaO4Ny1fg=nQ@mail.gmail.com>
Subject: Re: LFX Mentorship application
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============4462984289105047312=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4462984289105047312==
Content-Type: multipart/alternative; boundary="000000000000a0e08905c8906cf1"

--000000000000a0e08905c8906cf1
Content-Type: text/plain; charset="UTF-8"

Results are categories based on the type of Warnings or Errors

Format :
[Warnning/ Error message]
[Explanations]
[code which get invoked]
[list of warnings/errors of same type]


> Then, the first task is to run checkpatch.pl on a few files below
> andshare the results:
>
> drivers/message/fusion/mptlan.c
>
./scripts/checkpatch.pl drivers/message/fusion/mptlan.c


**SPDX_LICENSE_TAG**
Missing or malformed SPDX-License-Identifier tag.
Every file should contain 'SPDX-License-Identifier' tag which specifies
the which license it uses, like 'GPL-2.0'. It was missing in this file,
but they mentioned the license in comments.
To fix this we need to use Tag and mention it like key value pair.
"SPDX-License-Identifier:GPL-2.0"

{scripts/checkpatch.pl code}
...
if ($comment !~ /^$/ &&
    $rawline !~ m@^\+\Q$comment\E SPDX-License-Identifier: @) {
      WARN("SPDX_LICENSE_TAG",
           "Missing or malformed SPDX-License-Identifier tag in line
$checklicenseline\n" . $herecurr);
}
...

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1: FILE: drivers/message/fusion/mptlan.c:1:
+/*



**EMBEDDED_FILENAME**
It's generally not useful and not standard practice to have the filename in
the
file.
To fix this just delete that line number #2

{scripts/checkpatch.pl code}
...
# check for embedded filenames
if ($rawline =~ /^\+.*\Q$realfile\E/) {
      WARN("EMBEDDED_FILENAME",
         "It's generally not useful to have the filename in the file\n" .
$herecurr);
}
...

WARNING: It's generally not useful to have the filename in the file
#2: FILE: drivers/message/fusion/mptlan.c:2:
+ *  linux/drivers/message/fusion/mptlan.c



**BLOCK_COMMENT_STYLE**
Block comments use '*' on subsequent lines
Block comment's each line should start with '*', except for first and last.
To fix this put '*' at begining of each line except, first and last

{scripts/checkpatch.pl code}
...
# Block comments use * on subsequent lines
if ($prevline =~ /$;[ \t]*$/ &&         #ends in comment
    $prevrawline =~ /^\+.*?\/\*/ &&     #starting /*
    $prevrawline !~ /\*\/[ \t]*$/ &&        #no trailing */
    $rawline =~ /^\+/ &&            #line is new
    $rawline !~ /^\+[ \t]*\*/) {        #no leading *
         WARN("BLOCK_COMMENT_STYLE",
                "Block comments use * on subsequent lines\n" . $hereprev);
}
...

#13: FILE: drivers/message/fusion/mptlan.c:13:
+/*
+    This program is free software; you can redistribute it and/or modify

WARNING: Block comments use * on subsequent lines
#355: FILE: drivers/message/fusion/mptlan.c:355:
+       /* Ok, do we need to do anything here? As far as
+          I can tell, this is when a new device gets added

WARNING: Block comments use * on subsequent lines
#459: FILE: drivers/message/fusion/mptlan.c:459:
+/* Send a LanReset message to the FW. This should result in the FW
returning
+   any buckets it still has. */

WARNING: Block comments use * on subsequent lines
#471: FILE: drivers/message/fusion/mptlan.c:471:
+/*     dlprintk((KERN_ERR MYNAM "/reset: Evil funkiness abounds! "
+       "Unable to allocate a request frame.\n"));

WARNING: Block comments use * on subsequent lines
#764: FILE: drivers/message/fusion/mptlan.c:764:
+   /* If we ever decide to send more than one Simple SGE per LANSend, then
+      we will need to make sure that LAST_ELEMENT only gets set on the

WARNING: Block comments use * on subsequent lines
#946: FILE: drivers/message/fusion/mptlan.c:946:
+/* dlprintk((KERN_INFO MYNAM "/receive_post_reply: freed %d buckets\n",
+         count));

**BLOCK_COMMENT_STYLE**
Block comments use a trailing "*/" on a separate line
The block comment's ending token "*/" should end on next line not on the
last
commented line.i.e closing (and also opening) comment tag should be on
separated
from actual comment.
To fix this delete "*/" and put it separate new line

{scripts/checkpatch.pl code}
...
# Block comments use */ on trailing lines
if ($rawline !~ m@^\+[ \t]*\*/[ \t]*$@ &&   #trailing */
    $rawline !~ m@^\+.*/\*.*\*/[ \t]*$@ &&  #inline /*...*/
    $rawline !~ m@^\+.*\*{2,}/[ \t]*$@ &&   #trailing **/
    $rawline =~ m@^\+[ \t]*.+\*\/[ \t]*$@) {    #non blank */
        WARN("BLOCK_COMMENT_STYLE",
            "Block comments use a trailing */ on a separate line\n" .
$herecurr);
}
...

WARNING: Block comments use a trailing */ on a separate line
#356: FILE: drivers/message/fusion/mptlan.c:356:
+          to the loop. */

WARNING: Block comments use a trailing */ on a separate line
#459: FILE: drivers/message/fusion/mptlan.c:459:
+   any buckets it still has. */

WARNING: Block comments use a trailing */ on a separate line
#765: FILE: drivers/message/fusion/mptlan.c:765:
+      last one. Otherwise, bad voodoo and evil funkiness will commence. */



**BRACKET_SPACE**
Space prohibited between function name and open parenthesis '('
Space should not use between function name and open parenthesis.
To fix this delete the space character between function name and
open parenthesis.

{scripts/checkpatch.pl code}
...
# check for spaces between functions and their parentheses.
while ($line =~ /($Ident)\s+\(/g) {
    my $name = $1;
    my $ctx_before = substr($line, 0, $-[1]);
    my $ctx = "$ctx_before$name";

    # Ignore those directives where spaces _are_ permitted.
    if ($name =~ /^(?:
        if|for|while|switch|return|case|
        volatile|__volatile__|
        __attribute__|format|__extension__|
        asm|__asm__)$/x)
     {
     # cpp #define statements have non-optional spaces, ie
     # if there is a space between the name and the open
     # parenthesis it is simply not a parameter group.
     } elsif ($ctx_before =~ /^.\s*\#\s*define\s*$/) {

     # cpp #elif statement condition may start with a (
     } elsif ($ctx =~ /^.\s*\#\s*elif\s*$/) {

     # If this whole things ends with a type its most
     # likely a typedef for a function.
     } elsif ($ctx =~ /$Type$/) {

     } else {
        if (WARN("SPACING",
                "space prohibited between function name and open
parenthesis '('\n" . $herecurr) &&
                   $fix) {
            $fixed[$fixlinenr] =~
                            s/\b$name\s+\(/$name\(/;
        }
    }
}
...

WARNING: space prohibited between function name and open parenthesis '('
#126: FILE: drivers/message/fusion/mptlan.c:126:
+static int  lan_reply (MPT_ADAPTER *ioc, MPT_FRAME_HDR *mf,

WARNING: space prohibited between function name and open parenthesis '('
#165: FILE: drivers/message/fusion/mptlan.c:165:
+lan_reply (MPT_ADAPTER *ioc, MPT_FRAME_HDR *mf, MPT_FRAME_HDR *reply)

WARNING: space prohibited between function name and open parenthesis '('
#223: FILE: drivers/message/fusion/mptlan.c:223:
+           printk (KERN_ERR MYNAM "/lan_reply: Got a turbo reply "

WARNING: space prohibited between function name and open parenthesis '('
#283: FILE: drivers/message/fusion/mptlan.c:283:
+       printk (KERN_ERR MYNAM "/lan_reply: Got a non-turbo "

WARNING: space prohibited between function name and open parenthesis '('
#322: FILE: drivers/message/fusion/mptlan.c:322:
+       dlprintk ((KERN_INFO "mptlan/ioc_reset: called netif_stop_queue for
%s.\n", dev->name));

WARNING: space prohibited between function name and open parenthesis '('
#383: FILE: drivers/message/fusion/mptlan.c:383:
+       printk (KERN_WARNING MYNAM "/lan_open: lan_reset failed.");

WARNING: space prohibited between function name and open parenthesis '('
#386: FILE: drivers/message/fusion/mptlan.c:386:
+           printk ("The ioc is active. Perhaps it needs to be"

WARNING: space prohibited between function name and open parenthesis '('
#389: FILE: drivers/message/fusion/mptlan.c:389:
+           printk ("The ioc in inactive, most likely in the "

WARNING: space prohibited between function name and open parenthesis '('
#435: FILE: drivers/message/fusion/mptlan.c:435:
+       printk (KERN_WARNING MYNAM "/lo: Unable to register for Event"

WARNING: space prohibited between function name and open parenthesis '('
#558: FILE: drivers/message/fusion/mptlan.c:558:
+       dlprintk (("mptlan/tx_timeout: calling netif_wake_queue for %s.\n",
dev->name));
\
WARNING: space prohibited between function name and open parenthesis '('
#628: FILE: drivers/message/fusion/mptlan.c:628:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Invalid SGL sent to
IOC!\n",

WARNING: space prohibited between function name and open parenthesis '('
#672: FILE: drivers/message/fusion/mptlan.c:672:
+mpt_lan_sdu_send (struct sk_buff *skb, struct net_device *dev)

WARNING: space prohibited between function name and open parenthesis '('
#694: FILE: drivers/message/fusion/mptlan.c:694:
+       printk (KERN_ERR "%s: no tx context available: %u\n",

WARNING: space prohibited between function name and open parenthesis '('
#704: FILE: drivers/message/fusion/mptlan.c:704:
+       printk (KERN_ERR "%s: Unable to alloc request frame\n",

WARNING: space prohibited between function name and open parenthesis '('
#781: FILE: drivers/message/fusion/mptlan.c:781:
+   mpt_put_msg_frame (LanCtx, mpt_dev, mf);

WARNING: space prohibited between function name and open parenthesis '('
#865: FILE: drivers/message/fusion/mptlan.c:865:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: space prohibited between function name and open parenthesis '('
#978: FILE: drivers/message/fusion/mptlan.c:978:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Got a non-TURBO "

WARNING: space prohibited between function name and open parenthesis '('
#981: FILE: drivers/message/fusion/mptlan.c:981:
+       printk (KERN_ERR MYNAM ": MsgFlags = %02x, IOCStatus = %04x\n",

WARNING: space prohibited between function name and open parenthesis '('
#1011: FILE: drivers/message/fusion/mptlan.c:1011:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: space prohibited between function name and open parenthesis '('
#1053: FILE: drivers/message/fusion/mptlan.c:1053:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: space prohibited between function name and open parenthesis '('
#1094: FILE: drivers/message/fusion/mptlan.c:1094:
+       printk (KERN_ERR MYNAM ": %s/%s: Yoohoo! mpt_rxfidx_tail = %d, "

WARNING: space prohibited between function name and open parenthesis '('
#1104: FILE: drivers/message/fusion/mptlan.c:1104:
+       printk (KERN_WARNING MYNAM ": %s/%s: WARNING - IOC out of buckets! "

WARNING: space prohibited between function name and open parenthesis '('
#1109: FILE: drivers/message/fusion/mptlan.c:1109:
+       printk (KERN_INFO MYNAM ": %s/%s: IOC says %d buckets left. "

WARNING: space prohibited between function name and open parenthesis '('
#1118: FILE: drivers/message/fusion/mptlan.c:1118:
+       printk (KERN_WARNING MYNAM " Mismatch between driver's "

WARNING: space prohibited between function name and open parenthesis '('
#1164: FILE: drivers/message/fusion/mptlan.c:1164:
+           printk (KERN_ERR "%s: Unable to alloc request frame\n",

WARNING: space prohibited between function name and open parenthesis '('
#1191: FILE: drivers/message/fusion/mptlan.c:1191:
+               printk (KERN_ERR "%s: Can't alloc context\n",

WARNING: space prohibited between function name and open parenthesis '('
#1213: FILE: drivers/message/fusion/mptlan.c:1213:
+                   printk (KERN_WARNING

WARNING: space prohibited between function name and open parenthesis '('
#1252: FILE: drivers/message/fusion/mptlan.c:1252:
+/**/           printk (KERN_WARNING MYNAM "/%s: No buckets posted\n",

WARNING: space prohibited between function name and open parenthesis '('
#1300: FILE: drivers/message/fusion/mptlan.c:1300:
+mpt_register_lan_device (MPT_ADAPTER *mpt_dev, int pnum)

WARNING: space prohibited between function name and open parenthesis '('
#1442: FILE: drivers/message/fusion/mptlan.c:1442:
+static int __init mpt_lan_init (void)

WARNING: space prohibited between function name and open parenthesis '('
#1449: FILE: drivers/message/fusion/mptlan.c:1449:
+       printk (KERN_ERR MYNAM ": Failed to register with MPT base
driver\n");

WARNING: space prohibited between function name and open parenthesis '('
#1500: FILE: drivers/message/fusion/mptlan.c:1500:
+       printk (KERN_WARNING MYNAM ": %s: WARNING - Broadcast swap F/W bug
detected!\n",

WARNING: space prohibited between function name and open parenthesis '('
#1502: FILE: drivers/message/fusion/mptlan.c:1502:
+       printk (KERN_WARNING MYNAM ": Please update sender @ MAC_addr =
%pM\n",


**BRACKET_SPACE**
Space prohibited before that close parenthesis ')'
It not good practice to add spaces wherever not requireed line before the
close
parenthesis.
To fix this we need to delete space character before close parathesis.

{scripts/checkpatch.pl code}
...
# check for spaces before close parenthesis
if ($line =~ /(\s+)\)/ && $line !~ /^.\s*\)/ &&
    $line !~ /for\s*\(.*;\s+\)/ &&
    $line !~ /:\s+\)/) {
    if (ERROR("SPACING",
          "space prohibited before that close parenthesis ')'\n" .
$herecurr) &&
        $fix) {
        $fixed[$fixlinenr] =~
            s/\s+\)/\)/;
    }
}
...

ERROR: space prohibited before that close parenthesis ')'
#809: FILE: drivers/message/fusion/mptlan.c:809:
+              IOC_AND_NETDEV_NAMES_s_s(dev) ));



Possible unnecessary 'out of memory' message
This messages are printed in kernel log , if it cannot allocate memory,
and since there will be alot of them this messages will also increase in
kernel log. Hence, it is required to minimize it.
To fix this instead of printing the message we can return with ENOMEM.
ENOMEM is macro defined for "out of memory" error.

{scripts/checkpatch.pl code}
...
# check for unnecessary "Out of Memory" messages
if ($line =~ /^\+.*\b$logFunctions\s*\(/ &&
    $prevline =~ /^[
\+]\s*if\s*\(\s*(\!\s*|NULL\s*==\s*)?($Lval)(\s*==\s*NULL\s*)?\s*\)/ &&
    (defined $1 || defined $3) &&
    $linenr > 3) {
    my $testval = $2;
    my $testline = $lines[$linenr - 3];

    my ($s, $c) = ctx_statement_block($linenr - 3, $realcnt, 0);
#           print("line: <$line>\nprevline: <$prevline>\ns: <$s>\nc:
<$c>\n\n\n");

    if ($s =~ /(?:^|\n)[
\+]\s*(?:$Type\s*)?\Q$testval\E\s*=\s*(?:\([^\)]*\)\s*)?\s*$allocFunctions\s*\(/
&&
        $s !~ /\b__GFP_NOWARN\b/ ) {
        WARN("OOM_MESSAGE",
             "Possible unnecessary 'out of memory' message\n" . $hereprev);
    }
}
...

#865: FILE: drivers/message/fusion/mptlan.c:865:
+       if (!skb) {
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: Possible unnecessary 'out of memory' message
#1213: FILE: drivers/message/fusion/mptlan.c:1213:
+               if (skb == NULL) {
+                   printk (KERN_WARNING

WARNING: Possible unnecessary 'out of memory' message
#1011: FILE: drivers/message/fusion/mptlan.c:1011:
+       if (!skb) {
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: Possible unnecessary 'out of memory' message
#1053: FILE: drivers/message/fusion/mptlan.c:1053:
+       if (!skb) {
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",



Unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
casting is not require in this situation. It could be difficult to trace
bug if any in
there.Because compiler would  suppress the warning due to casting.
Remove the extra casting syntax before the function call to fix this
warning.

{scripts/checkpatch.pl code}
...
# check for pointless casting of alloc functions
        if ($line =~ /\*\s*\)\s*$allocFunctions\b/) {
            WARN("UNNECESSARY_CASTS",
                 "unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html\n" . $herecurr);
        }
...

WARNING: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
#1009: FILE: drivers/message/fusion/mptlan.c:1009:
+       skb = (struct sk_buff *)dev_alloc_skb(len);

WARNING: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
#1051: FILE: drivers/message/fusion/mptlan.c:1051:
+       skb = (struct sk_buff *)dev_alloc_skb(len);

WARNING: unnecessary cast may hide bugs, see
http://c-faq.com/malloc/mallocnocast.html
#863: FILE: drivers/message/fusion/mptlan.c:863:
+       skb = (struct sk_buff *)dev_alloc_skb(len);




This is code which never gonna execute or unreachable.So , it is pointless
to
have it.
Delete that block of code between #if 0 and #endif

{scripts/checkpatch.pl code}
...
# warn about #if 0
if ($line =~ /^.\s*\#\s*if\s+0\b/) {
    WARN("IF_0",
         "Consider removing the code enclosed by this #if 0 and its
#endif\n" . $herecurr);
}
...

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#188: FILE: drivers/message/fusion/mptlan.c:188:
+#if 0




space required after that ',' (ctx:VxV)
spacing is important wherever required, it the improves readablity of code.
Like comma ','  acts like separator for tokens to compiler, spaces also help
us to read it better while debugging.
To fix it insert space after ','

{scripts/checkpatch.pl code}
...
} elsif ($op eq ',') {
    ...
    if ($ctx !~ /.x[WEC]/ && $cc !~ /^}/) {
        if (ERROR("SPACING",
              "space required after that '$op' $at\n" . $hereptr)) {
            $line_fixed = 1;
            $last_after = $n;
            $space_after = 1;
        }
    }
...


ERROR: space required after that ',' (ctx:VxV)
#505: FILE: drivers/message/fusion/mptlan.c:505:
+         priv->total_posted,atomic_read(&priv->buckets_out)));

ERROR: space required after that ',' (ctx:VxV)
#1087: FILE: drivers/message/fusion/mptlan.c:1087:
+       skb_put(skb,len);



Spaces required around that '==' (ctx:VxV)
spacing is important wherever required, it the improves readablity of code.
Inserting proper spaces like around "==" is good practice.
To fix it insert space ' ' around '=='

{scripts/checkpatch.pl code}
...
# All the others need spaces both sides.
} elsif ($ctx !~ /[EWC]x[CWE]/) {
    my $ok = 0;

    # Ignore email addresses <foo@bar>
    if (($op eq '<' &&
         $cc =~ /^\S+\@\S+>/) ||
        ($op eq '>' &&
         $ca =~ /<\S+\@\S+$/))
    {
        $ok = 1;
    }

    # for asm volatile statements
    # ignore a colon with another
    # colon immediately before or after
    if (($op eq ':') &&
        ($ca =~ /:$/ || $cc =~ /^:/)) {
        $ok = 1;
    }

    # messages are ERROR, but ?: are CHK
    if ($ok == 0) {
        my $msg_level = \&ERROR;
        $msg_level = \&CHK if (($op eq '?:' || $op eq '?' || $op eq ':') &&
$ctx =~ /VxV/);

        if (&{$msg_level}("SPACING",
                  "spaces required around that '$op' $at\n" . $hereptr)) {
            $good = rtrim($fix_elements[$n]) . " " . trim($fix_elements[$n
+ 1]) . " ";
            if (defined $fix_elements[$n + 2]) {
                $fix_elements[$n + 2] =~ s/^\s+//;
            }
            $line_fixed = 1;
        }
    }
}
...

ERROR: spaces required around that '==' (ctx:VxV)
#308: FILE: drivers/message/fusion/mptlan.c:308:
+           reset_phase==MPT_IOC_SETUP_RESET ? "setup" : (
                       ^
ERROR: spaces required around that '==' (ctx:VxV)
#309: FILE: drivers/message/fusion/mptlan.c:309:
+           reset_phase==MPT_IOC_PRE_RESET ? "pre" : "post")));
                       ^



No spaces at the start of a line.
Sometimes spaces can be redundant, also it could decrease the code
readablity.
Hence, it is also not good to insert wherever not recommended. Like
begining or
end of each instruction/statement.
Removing space from start of the line would fix this issue

{scripts/checkpatch.pl code}
...
# check for spaces at the beginning of a line.
# Exceptions:
#  1) within comments
#  2) indented preprocessor commands
#  3) hanging labels
if ($rawline =~ /^\+ / && $line !~ /^\+ *(?:$;|#|$Ident:)/)  {
    my $herevet = "$here\n" . cat_vet($rawline) . "\n";
    if (WARN("LEADING_SPACE",
         "please, no spaces at the start of a line\n" . $herevet) &&
        $fix) {
        $fixed[$fixlinenr] =~ s/^\+([ \t]+)/"\+" . tabify($1)/e;
    }
}
...

WARNING: please, no spaces at the start of a line
#723: FILE: drivers/message/fusion/mptlan.c:723:
+        dma = pci_map_single(mpt_dev->pcidev, skb->data, skb->len,$



printk() should include KERN_<LEVEL> facility level
Levels are important it helps to segregate while debugging using kernel log.
While printing kernel message we should include KERN_<Level> of message in
printk
To fix it we require something like printk(KERN_LEVEL, "message");
KERN_LEVEl is level we want to use for that message to log in kernel log

{scripts/checkpatch.pl code}
...
# printk should use KERN_* levels
        if ($line =~ /\bprintk\s*\(\s*(?!KERN_[A-Z]+\b)/) {
            WARN("PRINTK_WITHOUT_KERN_LEVEL",
                 "printk() should include KERN_<LEVEL> facility level\n" .
$herecurr);
        }
...

WARNING: printk() should include KERN_<LEVEL> facility level
#386: FILE: drivers/message/fusion/mptlan.c:386:
+           printk ("The ioc is active. Perhaps it needs to be"

WARNING: printk() should include KERN_<LEVEL> facility level
#389: FILE: drivers/message/fusion/mptlan.c:389:
+           printk ("The ioc in inactive, most likely in the "



No space before tabs
It is totally redundant or wrong practice to include spaces before tab.
If we can use tabs why we required spaces, it could mess up the things.
Deleting spaces before tab will fix this warning

{scripts/checkpatch.pl code}
...
# check for space before tabs.
if ($rawline =~ /^\+/ && $rawline =~ / \t/) {
    my $herevet = "$here\n" . cat_vet($rawline) . "\n";
    if (WARN("SPACE_BEFORE_TAB",
        "please, no space before tabs\n" . $herevet) &&
        $fix) {
        while ($fixed[$fixlinenr] =~
               s/(^\+.*) {$tabsize,$tabsize}\t/$1\t\t/) {}
        while ($fixed[$fixlinenr] =~
               s/(^\+.*) +\t/$1\t/) {}
    }
}
...

WARNING: please, no space before tabs
#1382: FILE: drivers/message/fusion/mptlan.c:1382:
+^IMPT_ADAPTER ^I^I*ioc = pci_get_drvdata(pdev);$

WARNING: please, no space before tabs
#1428: FILE: drivers/message/fusion/mptlan.c:1428:
+^IMPT_ADAPTER ^I^I*ioc = pci_get_drvdata(pdev);$


Code ident is improper here, after tab there is space at this two lines,
if we see the
WARNING: suspect code indent for conditional statements (0, 16)
#424: FILE: drivers/message/fusion/mptlan.c:424:
+/**/   for (i = 0; i < priv->tx_max_out; i++)
+/**/       dlprintk((" %xh", priv->mpt_txfidx[i]));

**CODE_INDENT**
Code indent should use tabs where possible
Tabs should use instead of spaces for code indent.
Replacing spaces with tab would fix this issue.

...
# at the beginning of a line any tabs must come first and anything
# more than $tabsize must use tabs.
if ($rawline =~ /^\+\s* \t\s*\S/ ||
    $rawline =~ /^\+\s*        \s*/) {
    my $herevet = "$here\n" . cat_vet($rawline) . "\n";
    $rpt_cleaners = 1;
    if (ERROR("CODE_INDENT",
          "code indent should use tabs where possible\n" . $herevet) &&
        $fix) {
        $fixed[$fixlinenr] =~ s/^\+([ \t]+)/"\+" . tabify($1)/e;
    }
}
...

ERROR: code indent should use tabs where possible
#723: FILE: drivers/message/fusion/mptlan.c:723:
+        dma = pci_map_single(mpt_dev->pcidev, skb->data, skb->len,$

ERROR: code indent should use tabs where possible
#808: FILE: drivers/message/fusion/mptlan.c:808:
+^I        dioprintk((KERN_INFO MYNAM ": %s/%s: Queued post_buckets
task.\n",$


**EMBEDDED_FUNCTION_NAME**
Prefer using '"%s...", __func__' to using __func__, this function's name,
in a string
The function name should not be mentioned as constant but passed as
variable __func__
which contains name of function. It will also help in future if changes
need to be done
then it will fetch name dynamically.
To fix this it will be like printk(KERN_ERR MYNAM "%s: Got a turbo
reply",__func__);

...
if ($line =~ /^\+.*$String/ &&
    defined($context_function) &&
    get_quoted_string($line, $rawline) =~ /\b$context_function\b/ &&
    length(get_quoted_string($line, $rawline)) !=
(length($context_function) + 2)) {
    WARN("EMBEDDED_FUNCTION_NAME",
         "Prefer using '\"%s...\", __func__' to using '$context_function',
this function's name, in a string\n" . $herecurr);
}
...

WARNING: Prefer using '"%s...", __func__' to using 'lan_reply', this
function's name, in a string
#223: FILE: drivers/message/fusion/mptlan.c:223:
+           printk (KERN_ERR MYNAM "/lan_reply: Got a turbo reply "

WARNING: Prefer using '"%s...", __func__' to using 'lan_reply', this
function's name, in a string
#179: FILE: drivers/message/fusion/mptlan.c:179:
+       dioprintk((KERN_INFO MYNAM ": %s/%s: @lan_reply, tmsg %08x\n",

WARNING: Prefer using '"%s...", __func__' to using 'lan_reply', this
function's name, in a string
#262: FILE: drivers/message/fusion/mptlan.c:262:
+           dioprintk((KERN_INFO MYNAM "@lan_reply: zero context "

WARNING: Prefer using '"%s...", __func__' to using 'lan_reply', this
function's name, in a string
#283: FILE: drivers/message/fusion/mptlan.c:283:
+       printk (KERN_ERR MYNAM "/lan_reply: Got a non-turbo "

WARNING: Prefer using '"%s...", __func__' to using 'mpt_lan_close', this
function's name, in a string
#499: FILE: drivers/message/fusion/mptlan.c:499:
+   dlprintk((KERN_INFO MYNAM ": mpt_lan_close called\n"));
           ^

WARNING: Prefer using '"%s...", __func__' to using
'mpt_lan_receive_post_reply', this function's name, in a string
#968: FILE: drivers/message/fusion/mptlan.c:968:
+   dioprintk((KERN_INFO MYNAM ": mpt_lan_receive_post_reply called\n"));


Here we should prefer the use of repective subsystem printing function
instead
of generalise one like printk(). Also we need to choose correct type of
printing
function like for err we have e.g netdev_err() or for info we we have
e.g netdev_info(). So, to fix this issue we should pick correct type of
printing
function of respective subsystem. And if we do so, since we are using here
dedicated function, we could benifit from it while debugging.

...
# prefer variants of (subsystem|netdev|dev|pr)_<level> to
printk(KERN_<LEVEL>
if ($line =~ /\b(printk(_once|_ratelimited)?)\s*\(\s*KERN_([A-Z]+)/) {
    my $printk = $1;
    my $modifier = $2;
    my $orig = $3;
    $modifier = "" if (!defined($modifier));
    my $level = lc($orig);
    $level = "warn" if ($level eq "warning");
    my $level2 = $level;
    $level2 = "dbg" if ($level eq "debug");
    $level .= $modifier;
    $level2 .= $modifier;
    WARN("PREFER_PR_LEVEL",
         "Prefer [subsystem eg: netdev]_$level2([subsystem]dev, ... then
dev_$level2(dev, ... then pr_$level(...  to $printk(KERN_$orig ...\n" .
$herecurr);
}
...

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#223: FILE: drivers/message/fusion/mptlan.c:223:

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#283: FILE: drivers/message/fusion/mptlan.c:283:
+       printk (KERN_ERR MYNAM "/lan_reply: Got a non-turbo "

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#383: FILE: drivers/message/fusion/mptlan.c:383:
+       printk (KERN_WARNING MYNAM "/lan_open: lan_reset failed.");

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#431: FILE: drivers/message/fusion/mptlan.c:431:
+   printk(KERN_INFO MYNAM ": %s/%s: interface up & active\n",

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#435: FILE: drivers/message/fusion/mptlan.c:435:
+       printk (KERN_WARNING MYNAM "/lo: Unable to register for Event"

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#543: FILE: drivers/message/fusion/mptlan.c:543:
+   printk(KERN_INFO MYNAM ": %s/%s: interface down & inactive\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#628: FILE: drivers/message/fusion/mptlan.c:628:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Invalid SGL sent to
IOC!\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#694: FILE: drivers/message/fusion/mptlan.c:694:
+       printk (KERN_ERR "%s: no tx context available: %u\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#704: FILE: drivers/message/fusion/mptlan.c:704:
+       printk (KERN_ERR "%s: Unable to alloc request frame\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#865: FILE: drivers/message/fusion/mptlan.c:865:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#978: FILE: drivers/message/fusion/mptlan.c:978:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Got a non-TURBO "

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#981: FILE: drivers/message/fusion/mptlan.c:981:
+       printk (KERN_ERR MYNAM ": MsgFlags = %02x, IOCStatus = %04x\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1011: FILE: drivers/message/fusion/mptlan.c:1011:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1053: FILE: drivers/message/fusion/mptlan.c:1053:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb!
(%s@%d)\n",
                   ^
WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1252: FILE: drivers/message/fusion/mptlan.c:1252:
+/**/           printk (KERN_WARNING MYNAM "/%s: No buckets posted\n",

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#1387: FILE: drivers/message/fusion/mptlan.c:1387:
+       printk(KERN_INFO MYNAM ": %s: PortNum=%x, "

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#1396: FILE: drivers/message/fusion/mptlan.c:1396:
+           printk(KERN_INFO MYNAM ": %s: Hmmm... LAN protocol "

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1404: FILE: drivers/message/fusion/mptlan.c:1404:
+           printk(KERN_ERR MYNAM ": %s: Unable to register "

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#1410: FILE: drivers/message/fusion/mptlan.c:1410:
+       printk(KERN_INFO MYNAM ": %s: Fusion MPT LAN device "

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#1412: FILE: drivers/message/fusion/mptlan.c:1412:
+       printk(KERN_INFO MYNAM ": %s/%s: "

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1449: FILE: drivers/message/fusion/mptlan.c:1449:
+       printk (KERN_ERR MYNAM ": Failed to register with MPT base
driver\n");

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1456: FILE: drivers/message/fusion/mptlan.c:1456:
+       printk(KERN_ERR MYNAM ": Eieee! unable to register a reset "

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1500: FILE: drivers/message/fusion/mptlan.c:1500:
+       printk (KERN_WARNING MYNAM ": %s: WARNING - Broadcast swap F/W bug
detected!\n",

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1502: FILE: drivers/message/fusion/mptlan.c:1502:
+       printk (KERN_WARNING MYNAM ": Please update sender @ MAC_addr =
%pM\n",

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1118: FILE: drivers/message/fusion/mptlan.c:1118:
+       printk (KERN_WARNING MYNAM " Mismatch between driver's "

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1164: FILE: drivers/message/fusion/mptlan.c:1164:
+           printk (KERN_ERR "%s: Unable to alloc request frame\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1191: FILE: drivers/message/fusion/mptlan.c:1191:
+               printk (KERN_ERR "%s: Can't alloc context\n",

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1213: FILE: drivers/message/fusion/mptlan.c:1213:
+                   printk (KERN_WARNING

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1094: FILE: drivers/message/fusion/mptlan.c:1094:
+       printk (KERN_ERR MYNAM ": %s/%s: Yoohoo! mpt_rxfidx_tail = %d, "

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1104: FILE: drivers/message/fusion/mptlan.c:1104:
+       printk (KERN_WARNING MYNAM ": %s/%s: WARNING - IOC out of buckets! "

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then
dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#1109: FILE: drivers/message/fusion/mptlan.c:1109:
+       printk (KERN_INFO MYNAM ": %s/%s: IOC says %d buckets left. "


**TRAILING_WHITESPACES**
Trailing whitespace
Trailing whitespaces at end of line is not standard practice.
Deleting it would fix this issue from this file

...
trailing whitespace
if ($line =~ /^\+.*\015/) {
    my $herevet = "$here\n" . cat_vet($rawline) . "\n";
    if (ERROR("DOS_LINE_ENDINGS",
          "DOS line endings\n" . $herevet) &&
        $fix) {
        $fixed[$fixlinenr] =~ s/[\s\015]+$//;
    }
} elsif ($rawline =~ /^\+.*\S\s+$/ || $rawline =~ /^\+\s+$/) {
    my $herevet = "$here\n" . cat_vet($rawline) . "\n";
    if (ERROR("TRAILING_WHITESPACE",
          "trailing whitespace\n" . $herevet) &&
        $fix) {
        $fixed[$fixlinenr] =~ s/\s+$//;
    }

    $rpt_cleaners = 1;
}
...

ERROR: trailing whitespace
#799: FILE: drivers/message/fusion/mptlan.c:799:
+^I$

ERROR: trailing whitespace
#1113: FILE: drivers/message/fusion/mptlan.c:1113:
+^I$

ERROR: trailing whitespace
#1117: FILE: drivers/message/fusion/mptlan.c:1117:
+^I^I$

ERROR: trailing whitespace
#1124: FILE: drivers/message/fusion/mptlan.c:1124:
+^I^I$

ERROR: trailing whitespace
#1128: FILE: drivers/message/fusion/mptlan.c:1128:
+^I$

ERROR: trailing whitespace
#1409: FILE: drivers/message/fusion/mptlan.c:1409:
+^I^I$

ERROR: trailing whitespace
#1416: FILE: drivers/message/fusion/mptlan.c:1416:
+^I$

ERROR: trailing whitespace
#1463: FILE: drivers/message/fusion/mptlan.c:1463:
+^I$


Quoted string split across lines
splited string across lines is not good aproach because it could affect the
result of grep, while searching the error in kernel log.
To fix this there are multple options
    1] try to use full line for that string, till 80(max 100*) characters
    2] shrunk the message that could fit in less 80(max 100*) characters
line
    3] use any of '\n','\t',';','{' character at the end of previous string

...
#check for user-visible strings broken across lines, which breaks the
ability
# to grep for the string.  Make exceptions when the previous string ends in
a
# newline (multiple lines in one string constant) or '\t', '\r', ';', or '{'
# (common in inline assembly) or is a octal \123 or hexadecimal \xaf value
if ($line =~ /^\+\s*$String/ &&
    $prevline =~ /"\s*$/ &&
    $prevrawline !~
/(?:\\(?:[ntr]|[0-7]{1,3}|x[0-9a-fA-F]{1,2})|;\s*|\{\s*)"\s*$/) {
    if (WARN("SPLIT_STRING",
         "quoted string split across lines\n" . $hereprev) &&
             $fix &&
             $prevrawline =~ /^\+.*"\s*$/ &&
             $last_coalesced_string_linenr != $linenr - 1) {
             ...
    }
}
...

WARNING: quoted string split across lines
#224: FILE: drivers/message/fusion/mptlan.c:224:
+           printk (KERN_ERR MYNAM "/lan_reply: Got a turbo reply "
+               "that I don't know what to do with\n");

WARNING: quoted string split across lines
#263: FILE: drivers/message/fusion/mptlan.c:263:
+           dioprintk((KERN_INFO MYNAM "@lan_reply: zero context "
+                 "ReceivePostReply received.\n"));

WARNING: quoted string split across lines
#284: FILE: drivers/message/fusion/mptlan.c:284:
+       printk (KERN_ERR MYNAM "/lan_reply: Got a non-turbo "
+           "reply that I don't know what to do with\n");

WARNING: quoted string split across lines
#387: FILE: drivers/message/fusion/mptlan.c:387:
+           printk ("The ioc is active. Perhaps it needs to be"
+               " reset?\n");

WARNING: quoted string split across lines
#390: FILE: drivers/message/fusion/mptlan.c:390:
+           printk ("The ioc in inactive, most likely in the "
+               "process of being reset. Please try again in "

WARNING: quoted string split across lines
#391: FILE: drivers/message/fusion/mptlan.c:391:
+               "process of being reset. Please try again in "
+               "a moment.\n");

WARNING: quoted string split across lines
#979: FILE: drivers/message/fusion/mptlan.c:979:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Got a non-TURBO "
+           "ReceivePostReply w/ PacketLength zero!\n",

WARNING: quoted string split across lines
#915: FILE: drivers/message/fusion/mptlan.c:915:
+/**/   dlprintk((KERN_INFO MYNAM "/receive_post_reply: "
+         "IOC returned %d buckets, freeing them...\n", count));

WARNING: quoted string split across lines
#822: FILE: drivers/message/fusion/mptlan.c:822:
+   dioprintk((KERN_INFO MYNAM ": %s/%s: Incoming packet (%d bytes) "
+        "delivered to upper level.\n",

WARNING: quoted string split across lines
#806: FILE: drivers/message/fusion/mptlan.c:806:
+           dioprintk((KERN_INFO MYNAM ": post_buckets queued on "
+                  "timer.\n"));

WARNING: quoted string split across lines
#504: FILE: drivers/message/fusion/mptlan.c:504:
+   dlprintk((KERN_INFO MYNAM ":lan_close: Posted %d buckets "
+         "since driver was loaded, %d still out\n",

WARNING: quoted string split across lines
#436: FILE: drivers/message/fusion/mptlan.c:436:
+       printk (KERN_WARNING MYNAM "/lo: Unable to register for Event"
+           " Notifications. This is a bad thing! We're not going "

WARNING: quoted string split across lines
#437: FILE: drivers/message/fusion/mptlan.c:437:
+           " Notifications. This is a bad thing! We're not going "
+           "to go ahead, but I'd be leery of system stability at "

WARNING: quoted string split across lines
#438: FILE: drivers/message/fusion/mptlan.c:438:
+           "to go ahead, but I'd be leery of system stability at "
+           "this point.\n");

WARNING: quoted string split across lines
#838: FILE: drivers/message/fusion/mptlan.c:838:
+   dioprintk((KERN_INFO MYNAM "/receive_post_reply: %d buckets "
+         "remaining, %d received back since sod\n",

WARNING: quoted string split across lines
#1095: FILE: drivers/message/fusion/mptlan.c:1095:
+       printk (KERN_ERR MYNAM ": %s/%s: Yoohoo! mpt_rxfidx_tail = %d, "
+           "MPT_LAN_MAX_BUCKETS_OUT = %d\n",

WARNING: quoted string split across lines
#1105: FILE: drivers/message/fusion/mptlan.c:1105:
+       printk (KERN_WARNING MYNAM ": %s/%s: WARNING - IOC out of buckets! "
+           "(priv->buckets_out = %d)\n",

WARNING: quoted string split across lines
#1110: FILE: drivers/message/fusion/mptlan.c:1110:
+       printk (KERN_INFO MYNAM ": %s/%s: IOC says %d buckets left. "
+           "(priv->buckets_out = %d)\n",

WARNING: quoted string split across lines
#1457: FILE: drivers/message/fusion/mptlan.c:1457:
+       printk(KERN_ERR MYNAM ": Eieee! unable to register a reset "
+              "handler with mptbase! The world is at an end! "

WARNING: quoted string split across lines
#1458: FILE: drivers/message/fusion/mptlan.c:1458:
+              "handler with mptbase! The world is at an end! "
+              "Everything is fading to black! Goodbye.\n");

WARNING: quoted string split across lines
#1413: FILE: drivers/message/fusion/mptlan.c:1413:
+       printk(KERN_INFO MYNAM ": %s/%s: "
+              "LanAddr = %pM\n",

WARNING: quoted string split across lines
#1411: FILE: drivers/message/fusion/mptlan.c:1411:
+       printk(KERN_INFO MYNAM ": %s: Fusion MPT LAN device "
+              "registered as '%s'\n", ioc->name, dev->name);

WARNING: quoted string split across lines
#1405: FILE: drivers/message/fusion/mptlan.c:1405:
+           printk(KERN_ERR MYNAM ": %s: Unable to register "
+                  "port%d as a LAN device\n", ioc->name,

WARNING: quoted string split across lines
#1397: FILE: drivers/message/fusion/mptlan.c:1397:
+           printk(KERN_INFO MYNAM ": %s: Hmmm... LAN protocol "
+                  "seems to be disabled on this adapter port!\n",

WARNING: quoted string split across lines
#1388: FILE: drivers/message/fusion/mptlan.c:1388:
+       printk(KERN_INFO MYNAM ": %s: PortNum=%x, "
+              "ProtocolFlags=%02Xh (%c%c%c%c)\n",

WARNING: quoted string split across lines
#1370: FILE: drivers/message/fusion/mptlan.c:1370:
+   dlprintk((KERN_INFO MYNAM ": Finished registering dev "
+       "and setting initial values\n"));

WARNING: quoted string split across lines
#1119: FILE: drivers/message/fusion/mptlan.c:1119:
+       printk (KERN_WARNING MYNAM " Mismatch between driver's "
+           "buckets_out count and fw's BucketsRemaining "

WARNING: quoted string split across lines
#1120: FILE: drivers/message/fusion/mptlan.c:1120:
+           "buckets_out count and fw's BucketsRemaining "
+           "count has crossed the threshold, issuing a "

WARNING: quoted string split across lines
#1121: FILE: drivers/message/fusion/mptlan.c:1121:
+           "count has crossed the threshold, issuing a "
+           "LanReset to clear the fw's hashtable. You may "

WARNING: quoted string split across lines
#1122: FILE: drivers/message/fusion/mptlan.c:1122:
+           "LanReset to clear the fw's hashtable. You may "
+           "want to check your /var/log/messages for \"CRC "

WARNING: quoted string split across lines
#1123: FILE: drivers/message/fusion/mptlan.c:1123:
+           "want to check your /var/log/messages for \"CRC "
+           "error\" event notifications.\n");






else is not generally useful after a break or return
Here presence of else doesn't matter its optional, and better would be
removing
it. Because, anyways else part will get executed after if condition fails.
It's redundant.
removing the else and keeping apropriate indent would fix this issue.

...
# check indentation of any line with a bare else
# (but not if it is a multiple line "if (foo) return bar; else return baz;")
# if the previous line is a break or return and is indented 1 tab more...
if ($sline =~ /^\+([\t]+)(?:}[ \t]*)?else(?:[ \t]*{)?\s*$/) {
    my $tabs = length($1) + 1;
    if ($prevline =~ /^\+\t{$tabs,$tabs}break\b/ ||
        ($prevline =~ /^\+\t{$tabs,$tabs}return\b/ &&
         defined $lines[$linenr] &&
         $lines[$linenr] !~ /^[ \+]\t{$tabs,$tabs}return/)) {
        WARN("UNNECESSARY_ELSE",
             "else is not generally useful after a break or return\n" .
$hereprev);
    }
}
...

WARNING: else is not generally useful after a break or return
#304: FILE: drivers/message/fusion/mptlan.c:304:
+       return(1);
+   else


Braces {} are not necessary for any arm of this statement
curly braces are optional if there is only of statement in if-else block.
removing would not affect the functionality of program. It is sort of
redundant.
To fix this warning remove the pair of curly braces  {}

...
# check for redundant bracing round if etc
if ($line =~ /(^.*)\bif\b/ && $1 !~ /else\s*$/) {
    my ($level, $endln, @chunks) =
        ctx_statement_full($linenr, $realcnt, 1);
    #print "chunks<$#chunks> linenr<$linenr> endln<$endln> level<$level>\n";
    #print "APW: <<$chunks[1][0]>><<$chunks[1][1]>>\n";
    if ($#chunks > 0 && $level == 0) {
        my @allowed = ();
        my $allow = 0;
        my $seen = 0;
        my $herectx = $here . "\n";
        my $ln = $linenr - 1;
        for my $chunk (@chunks) {
            my ($cond, $block) = @{$chunk};

            # If the condition carries leading newlines, then count those
as offsets.
            my ($whitespace) = ($cond =~ /^((?:\s*\n[+-])*\s*)/s);
            my $offset = statement_rawlines($whitespace) - 1;

            $allowed[$allow] = 0;
            #print "COND<$cond> whitespace<$whitespace> offset<$offset>\n";

            # We have looked at and allowed this specific line.
            $suppress_ifbraces{$ln + $offset} = 1;

            $herectx .= "$rawlines[$ln + $offset]\n[...]\n";
            $ln += statement_rawlines($block) - 1;

            substr($block, 0, length($cond), '');

            $seen++ if ($block =~ /^\s*{/);

            #print "cond<$cond> block<$block> allowed<$allowed[$allow]>\n";
            if (statement_lines($cond) > 1) {
                #print "APW: ALLOWED: cond<$cond>\n";
                $allowed[$allow] = 1;
            }
            if ($block =~/\b(?:if|for|while)\b/) {
                #print "APW: ALLOWED: block<$block>\n";
                $allowed[$allow] = 1;
            }
            if (statement_block_size($block) > 1) {
                #print "APW: ALLOWED: lines block<$block>\n";
                $allowed[$allow] = 1;
            }
            $allow++;
        }
        if ($seen) {
            my $sum_allowed = 0;
            foreach (@allowed) {
                $sum_allowed += $_;
            }
            if ($sum_allowed == 0) {
                WARN("BRACES",
                     "braces {} are not necessary for any arm of this
statement\n" . $herectx);
            } elsif ($sum_allowed != $allow &&
                 $seen != $allow) {
                CHK("BRACES",
                    "braces {} should be used on all arms of this
statement\n" . $herectx);
            }
        }
    }
}
...

WARNING: braces {} are not necessary for any arm of this statement
#1507: FILE: drivers/message/fusion/mptlan.c:1507:
+       if (!memcmp(fch->daddr, dev->broadcast, FC_ALEN)) {
[...]
+       } else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
#1513: FILE: drivers/message/fusion/mptlan.c:1513:
+       if (memcmp(fch->daddr, dev->dev_addr, FC_ALEN)) {
[...]
+       } else {
[...]



> drivers/infiniband/hw/hfi1/sysfs.c
>
$ ./scripts/checkpatch.pl drivers/infiniband/hw/hfi1/sysfs.c

**SPDX_LICENSE_TAG**
Missing or malformed SPDX-License-Identifier tag.
Every file should contain 'SPDX-License-Identifier' tag which specifies
the which license it uses, like 'GPL-2.0'. It was missing in this file,
but they mentioned the license in comments.
To fix this we need to use Tag and mention it like key value pair.
"SPDX-License-Identifier:GPL-2.0"

{scripts/checkpatch.pl code}
...
if ($comment !~ /^$/ &&
    $rawline !~ m@^\+\Q$comment\E SPDX-License-Identifier: @) {
      WARN("SPDX_LICENSE_TAG",
           "Missing or malformed SPDX-License-Identifier tag in line
$checklicenseline\n" . $herecurr);
}
...

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1: FILE: drivers/infiniband/hw/hfi1/sysfs.c:1:
+/*



Returning string by sysfs_emit(...) should contain terminating newline.
That mean after the string new line character '\n' should be used.
To fix this after string format specifier '%s' we should use '\n'
It Will be something like
    return sysfs_emit(buf, "%s\n", dd->boardversion);

{scripts/checkpatch.pl code}
...
# return sysfs_emit(foo, fmt, ...) fmt without newline
if ($line =~ /\breturn\s+sysfs_emit\s*\(\s*$FuncArg\s*,\s*($String)/ &&
   substr($rawline, $-[6], $+[6] - $-[6]) !~ /\\n"$/) {
my $offset = $+[6] - 1;
if (WARN("SYSFS_EMIT",
"return sysfs_emit(...) formats should include a terminating newline\n" .
$herecurr) &&
   $fix) {
substr($fixed[$fixlinenr], $offset, 0) = '\\n';
}
}
...

WARNING: return sysfs_emit(...) formats should include a terminating newline
#479: FILE: drivers/infiniband/hw/hfi1/sysfs.c:479:
+   return sysfs_emit(buf, "%s", dd->boardversion);

WARNING: return sysfs_emit(...) formats should include a terminating newline
#522: FILE: drivers/infiniband/hw/hfi1/sysfs.c:522:
+   return sysfs_emit(buf, "%s", dd->serial);


**NON_OCTAL_PERMISSIONS**
Symbolic permission are not required here instead its equvivalent in Octal
representation.Since Octal is default representation. it also gives better
understanding of permission for user.

{scripts/checkpatch.pl code}
...
# check for uses of S_<PERMS> that could be octal for readability
while ($line =~ m{\b($multi_mode_perms_string_search)\b}g) {
my $oval = $1;
my $octal = perms_to_octal($oval);
if (WARN("SYMBOLIC_PERMS",
"Symbolic permissions '$oval' are not preferred. Consider using octal
permissions '$octal'.\n" . $herecurr) &&
   $fix) {
$fixed[$fixlinenr] =~ s/\Q$oval\E/$octal/;
}
}
...

WARNING: Symbolic permissions 'S_IWUSR | S_IRUGO' are not preferred.
Consider using octal permissions '0644'.
#681: FILE: drivers/infiniband/hw/hfi1/sysfs.c:681:
+static SDE_ATTR(cpu_list, S_IWUSR | S_IRUGO,

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using
octal permissions '0444'.
#684: FILE: drivers/infiniband/hw/hfi1/sysfs.c:684:
+static SDE_ATTR(vl, S_IRUGO, sde_show_vl, NULL);

-Vinesh Raut

--000000000000a0e08905c8906cf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Results are categories bas=
ed on the type of Warnings or Errors<br><br>Format :<br>[Warnning/ Error me=
ssage]<br>[Explanations]<br>[code which get invoked]<br>[list of warnings/e=
rrors of same type]<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Then, the first task is to run <a href=3D"http://check=
patch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> on a few f=
iles below<br>
andshare the results:<br>
<br>
drivers/message/fusion/mptlan.c<br></blockquote>./scripts/<a href=3D"http:/=
/checkpatch.pl">checkpatch.pl</a> drivers/message/fusion/mptlan.c<br><br><b=
r>**SPDX_LICENSE_TAG**<br>Missing or malformed SPDX-License-Identifier tag.=
<br>Every file should contain &#39;SPDX-License-Identifier&#39; tag which s=
pecifies<br>the which license it uses, like &#39;GPL-2.0&#39;. It was missi=
ng in this file,<br>but they mentioned the license in comments.<br>To fix t=
his we need to use Tag and mention it like key value pair.<br>&quot;SPDX-Li=
cense-Identifier:GPL-2.0&quot;<br><br>{scripts/<a href=3D"http://checkpatch=
.pl">checkpatch.pl</a> code} <br>...<br>if ($comment !~ /^$/ &amp;&amp;<br>=
=C2=A0 =C2=A0 $rawline !~ m@^\+\Q$comment\E SPDX-License-Identifier: @) {<b=
r>=C2=A0 =C2=A0 =C2=A0 WARN(&quot;SPDX_LICENSE_TAG&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Missing or malformed SPDX-License-Identifi=
er tag in line $checklicenseline\n&quot; . $herecurr);<br>} <br>...<br><br>=
WARNING: Missing or malformed SPDX-License-Identifier tag in line 1<br>#1: =
FILE: drivers/message/fusion/mptlan.c:1:<br>+/*<br><br><br><br>**EMBEDDED_F=
ILENAME**<br>It&#39;s generally not useful and not standard practice to hav=
e the filename in the<br>file.<br>To fix this just delete that line number =
#2<br><br>{scripts/<a href=3D"http://checkpatch.pl">checkpatch.pl</a> code}=
 <br>...<br># check for embedded filenames<br>if ($rawline =3D~ /^\+.*\Q$re=
alfile\E/) {<br>=C2=A0 =C2=A0 =C2=A0 WARN(&quot;EMBEDDED_FILENAME&quot;,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;It&#39;s generally not useful to h=
ave the filename in the file\n&quot; . $herecurr);<br>}<br>...<br><br>WARNI=
NG: It&#39;s generally not useful to have the filename in the file<br>#2: F=
ILE: drivers/message/fusion/mptlan.c:2:<br>+ * =C2=A0linux/drivers/message/=
fusion/mptlan.c<br><br><br><br>**BLOCK_COMMENT_STYLE**<br>Block comments us=
e &#39;*&#39; on subsequent lines<br>Block comment&#39;s each line should s=
tart with &#39;*&#39;, except for first and last.<br>To fix this put &#39;*=
&#39; at begining of each line except, first and last<br><br>{scripts/<a hr=
ef=3D"http://checkpatch.pl">checkpatch.pl</a> code} <br>...<br># Block comm=
ents use * on subsequent lines<br>if ($prevline =3D~ /$;[ \t]*$/ &amp;&amp;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ends in comment<br>=C2=A0 =C2=A0 $prevrawline=
 =3D~ /^\+.*?\/\*/ &amp;&amp; =C2=A0 =C2=A0 #starting /*<br>=C2=A0 =C2=A0 $=
prevrawline !~ /\*\/[ \t]*$/ &amp;&amp; =C2=A0 =C2=A0 =C2=A0 =C2=A0#no trai=
ling */<br>=C2=A0 =C2=A0 $rawline =3D~ /^\+/ &amp;&amp; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#line is new<br>=C2=A0 =C2=A0 $rawline !~ /^\+[ \t]=
*\*/) { =C2=A0 =C2=A0 =C2=A0 =C2=A0#no leading *<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0WARN(&quot;BLOCK_COMMENT_STYLE&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Block comments use * on subsequent=
 lines\n&quot; . $hereprev);<br>}<br>...<br><br>#13: FILE: drivers/message/=
fusion/mptlan.c:13:<br>+/*<br>+ =C2=A0 =C2=A0This program is free software;=
 you can redistribute it and/or modify<br><br>WARNING: Block comments use *=
 on subsequent lines<br>#355: FILE: drivers/message/fusion/mptlan.c:355:<br=
>+ =C2=A0 =C2=A0 =C2=A0 /* Ok, do we need to do anything here? As far as<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I can tell, this is when a new device =
gets added<br><br>WARNING: Block comments use * on subsequent lines<br>#459=
: FILE: drivers/message/fusion/mptlan.c:459:<br>+/* Send a LanReset message=
 to the FW. This should result in the FW returning<br>+ =C2=A0 any buckets =
it still has. */<br><br>WARNING: Block comments use * on subsequent lines<b=
r>#471: FILE: drivers/message/fusion/mptlan.c:471:<br>+/* =C2=A0 =C2=A0 dlp=
rintk((KERN_ERR MYNAM &quot;/reset: Evil funkiness abounds! &quot;<br>+ =C2=
=A0 =C2=A0 =C2=A0 &quot;Unable to allocate a request frame.\n&quot;));<br><=
br>WARNING: Block comments use * on subsequent lines<br>#764: FILE: drivers=
/message/fusion/mptlan.c:764:<br>+ =C2=A0 /* If we ever decide to send more=
 than one Simple SGE per LANSend, then<br>+ =C2=A0 =C2=A0 =C2=A0we will nee=
d to make sure that LAST_ELEMENT only gets set on the<br><br>WARNING: Block=
 comments use * on subsequent lines<br>#946: FILE: drivers/message/fusion/m=
ptlan.c:946:<br>+/* dlprintk((KERN_INFO MYNAM &quot;/receive_post_reply: fr=
eed %d buckets\n&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 count));<br><br>**=
BLOCK_COMMENT_STYLE**<br>Block comments use a trailing &quot;*/&quot; on a =
separate line<br>The block comment&#39;s ending token &quot;*/&quot; should=
 end on next line not on the last<br>commented line.i.e closing (and also o=
pening) comment tag should be on separated<br>from actual comment.<br>To fi=
x this delete &quot;*/&quot; and put it separate new line<br><br>{scripts/<=
a href=3D"http://checkpatch.pl">checkpatch.pl</a> code} <br>...<br># Block =
comments use */ on trailing lines<br>if ($rawline !~ m@^\+[ \t]*\*/[ \t]*$@=
 &amp;&amp; =C2=A0 #trailing */<br>=C2=A0 =C2=A0 $rawline !~ m@^\+.*/\*.*\*=
/[ \t]*$@ &amp;&amp; =C2=A0#inline /*...*/<br>=C2=A0 =C2=A0 $rawline !~ m@^=
\+.*\*{2,}/[ \t]*$@ &amp;&amp; =C2=A0 #trailing **/<br>=C2=A0 =C2=A0 $rawli=
ne =3D~ m@^\+[ \t]*.+\*\/[ \t]*$@) { =C2=A0 =C2=A0#non blank */<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 WARN(&quot;BLOCK_COMMENT_STYLE&quot;,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Block comments use a trailing */ on a se=
parate line\n&quot; . $herecurr);<br>}<br>...<br><br>WARNING: Block comment=
s use a trailing */ on a separate line<br>#356: FILE: drivers/message/fusio=
n/mptlan.c:356:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the loop. */<br><=
br>WARNING: Block comments use a trailing */ on a separate line<br>#459: FI=
LE: drivers/message/fusion/mptlan.c:459:<br>+ =C2=A0 any buckets it still h=
as. */<br><br>WARNING: Block comments use a trailing */ on a separate line<=
br>#765: FILE: drivers/message/fusion/mptlan.c:765:<br>+ =C2=A0 =C2=A0 =C2=
=A0last one. Otherwise, bad voodoo and evil funkiness will commence. */<br>=
<br><br><br>**BRACKET_SPACE**<br>Space prohibited between function name and=
 open parenthesis &#39;(&#39;<br>Space should not use between function name=
 and open parenthesis.<br>To fix this delete the space character between fu=
nction name and<br>open parenthesis.<br><br>{scripts/<a href=3D"http://chec=
kpatch.pl">checkpatch.pl</a> code} <br>...<br># check for spaces between fu=
nctions and their parentheses.<br>while ($line =3D~ /($Ident)\s+\(/g) {<br>=
=C2=A0 =C2=A0 my $name =3D $1;<br>=C2=A0 =C2=A0 my $ctx_before =3D substr($=
line, 0, $-[1]);<br>=C2=A0 =C2=A0 my $ctx =3D &quot;$ctx_before$name&quot;;=
<br><br>=C2=A0 =C2=A0 # Ignore those directives where spaces _are_ permitte=
d.<br>=C2=A0 =C2=A0 if ($name =3D~ /^(?:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if|=
for|while|switch|return|case|<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 volatile|__vol=
atile__|<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 __attribute__|format|__extension__|=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 asm|__asm__)$/x)<br>=C2=A0 =C2=A0 =C2=A0{<b=
r>=C2=A0 =C2=A0 =C2=A0# cpp #define statements have non-optional spaces, ie=
<br>=C2=A0 =C2=A0 =C2=A0# if there is a space between the name and the open=
<br>=C2=A0 =C2=A0 =C2=A0# parenthesis it is simply not a parameter group.<b=
r>=C2=A0 =C2=A0 =C2=A0} elsif ($ctx_before =3D~ /^.\s*\#\s*define\s*$/) {<b=
r><br>=C2=A0 =C2=A0 =C2=A0# cpp #elif statement condition may start with a =
(<br>=C2=A0 =C2=A0 =C2=A0} elsif ($ctx =3D~ /^.\s*\#\s*elif\s*$/) {<br><br>=
=C2=A0 =C2=A0 =C2=A0# If this whole things ends with a type its most<br>=C2=
=A0 =C2=A0 =C2=A0# likely a typedef for a function.<br>=C2=A0 =C2=A0 =C2=A0=
} elsif ($ctx =3D~ /$Type$/) {<br><br>=C2=A0 =C2=A0 =C2=A0} else {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (WARN(&quot;SPACING&quot;,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;space prohibited between funct=
ion name and open parenthesis &#39;(&#39;\n&quot; . $herecurr) &amp;&amp;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fix=
) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $fixed[$fixlinenr] =3D~<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 s/\b$name\s+\(/$name\(/;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br>WARNING: space prohibited be=
tween function name and open parenthesis &#39;(&#39;<br>#126: FILE: drivers=
/message/fusion/mptlan.c:126:<br>+static int =C2=A0lan_reply (MPT_ADAPTER *=
ioc, MPT_FRAME_HDR *mf,<br><br>WARNING: space prohibited between function n=
ame and open parenthesis &#39;(&#39;<br>#165: FILE: drivers/message/fusion/=
mptlan.c:165:<br>+lan_reply (MPT_ADAPTER *ioc, MPT_FRAME_HDR *mf, MPT_FRAME=
_HDR *reply)<br><br>WARNING: space prohibited between function name and ope=
n parenthesis &#39;(&#39;<br>#223: FILE: drivers/message/fusion/mptlan.c:22=
3:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;/la=
n_reply: Got a turbo reply &quot;<br><br>WARNING: space prohibited between =
function name and open parenthesis &#39;(&#39;<br>#283: FILE: drivers/messa=
ge/fusion/mptlan.c:283:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &q=
uot;/lan_reply: Got a non-turbo &quot;<br><br>WARNING: space prohibited bet=
ween function name and open parenthesis &#39;(&#39;<br>#322: FILE: drivers/=
message/fusion/mptlan.c:322:<br>+ =C2=A0 =C2=A0 =C2=A0 dlprintk ((KERN_INFO=
 &quot;mptlan/ioc_reset: called netif_stop_queue for %s.\n&quot;, dev-&gt;n=
ame));<br><br>WARNING: space prohibited between function name and open pare=
nthesis &#39;(&#39;<br>#383: FILE: drivers/message/fusion/mptlan.c:383:<br>=
+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;/lan_open: lan_rese=
t failed.&quot;);<br><br>WARNING: space prohibited between function name an=
d open parenthesis &#39;(&#39;<br>#386: FILE: drivers/message/fusion/mptlan=
.c:386:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (&quot;The ioc is ac=
tive. Perhaps it needs to be&quot;<br><br>WARNING: space prohibited between=
 function name and open parenthesis &#39;(&#39;<br>#389: FILE: drivers/mess=
age/fusion/mptlan.c:389:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (&q=
uot;The ioc in inactive, most likely in the &quot;<br><br>WARNING: space pr=
ohibited between function name and open parenthesis &#39;(&#39;<br>#435: FI=
LE: drivers/message/fusion/mptlan.c:435:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (=
KERN_WARNING MYNAM &quot;/lo: Unable to register for Event&quot;<br><br>WAR=
NING: space prohibited between function name and open parenthesis &#39;(&#3=
9;<br>#558: FILE: drivers/message/fusion/mptlan.c:558:<br>+ =C2=A0 =C2=A0 =
=C2=A0 dlprintk ((&quot;mptlan/tx_timeout: calling netif_wake_queue for %s.=
\n&quot;, dev-&gt;name));<br>\<br>WARNING: space prohibited between functio=
n name and open parenthesis &#39;(&#39;<br>#628: FILE: drivers/message/fusi=
on/mptlan.c:628:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %=
s/%s: ERROR - Invalid SGL sent to IOC!\n&quot;,<br><br>WARNING: space prohi=
bited between function name and open parenthesis &#39;(&#39;<br>#672: FILE:=
 drivers/message/fusion/mptlan.c:672:<br>+mpt_lan_sdu_send (struct sk_buff =
*skb, struct net_device *dev)<br><br>WARNING: space prohibited between func=
tion name and open parenthesis &#39;(&#39;<br>#694: FILE: drivers/message/f=
usion/mptlan.c:694:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR &quot;%s: no=
 tx context available: %u\n&quot;,<br><br>WARNING: space prohibited between=
 function name and open parenthesis &#39;(&#39;<br>#704: FILE: drivers/mess=
age/fusion/mptlan.c:704:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR &quot;%=
s: Unable to alloc request frame\n&quot;,<br><br>WARNING: space prohibited =
between function name and open parenthesis &#39;(&#39;<br>#781: FILE: drive=
rs/message/fusion/mptlan.c:781:<br>+ =C2=A0 mpt_put_msg_frame (LanCtx, mpt_=
dev, mf);<br><br>WARNING: space prohibited between function name and open p=
arenthesis &#39;(&#39;<br>#865: FILE: drivers/message/fusion/mptlan.c:865:<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%=
s: ERROR - Can&#39;t allocate skb! (%s@%d)\n&quot;,<br><br>WARNING: space p=
rohibited between function name and open parenthesis &#39;(&#39;<br>#978: F=
ILE: drivers/message/fusion/mptlan.c:978:<br>+ =C2=A0 =C2=A0 =C2=A0 printk =
(KERN_ERR MYNAM &quot;: %s/%s: ERROR - Got a non-TURBO &quot;<br><br>WARNIN=
G: space prohibited between function name and open parenthesis &#39;(&#39;<=
br>#981: FILE: drivers/message/fusion/mptlan.c:981:<br>+ =C2=A0 =C2=A0 =C2=
=A0 printk (KERN_ERR MYNAM &quot;: MsgFlags =3D %02x, IOCStatus =3D %04x\n&=
quot;,<br><br>WARNING: space prohibited between function name and open pare=
nthesis &#39;(&#39;<br>#1011: FILE: drivers/message/fusion/mptlan.c:1011:<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s=
: ERROR - Can&#39;t allocate skb! (%s@%d)\n&quot;,<br><br>WARNING: space pr=
ohibited between function name and open parenthesis &#39;(&#39;<br>#1053: F=
ILE: drivers/message/fusion/mptlan.c:1053:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: ERROR - Can&#39;t allocate sk=
b! (%s@%d)\n&quot;,<br><br>WARNING: space prohibited between function name =
and open parenthesis &#39;(&#39;<br>#1094: FILE: drivers/message/fusion/mpt=
lan.c:1094:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s:=
 Yoohoo! mpt_rxfidx_tail =3D %d, &quot;<br><br>WARNING: space prohibited be=
tween function name and open parenthesis &#39;(&#39;<br>#1104: FILE: driver=
s/message/fusion/mptlan.c:1104:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARN=
ING MYNAM &quot;: %s/%s: WARNING - IOC out of buckets! &quot;<br><br>WARNIN=
G: space prohibited between function name and open parenthesis &#39;(&#39;<=
br>#1109: FILE: drivers/message/fusion/mptlan.c:1109:<br>+ =C2=A0 =C2=A0 =
=C2=A0 printk (KERN_INFO MYNAM &quot;: %s/%s: IOC says %d buckets left. &qu=
ot;<br><br>WARNING: space prohibited between function name and open parenth=
esis &#39;(&#39;<br>#1118: FILE: drivers/message/fusion/mptlan.c:1118:<br>+=
 =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot; Mismatch between dr=
iver&#39;s &quot;<br><br>WARNING: space prohibited between function name an=
d open parenthesis &#39;(&#39;<br>#1164: FILE: drivers/message/fusion/mptla=
n.c:1164:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR &quot;%s=
: Unable to alloc request frame\n&quot;,<br><br>WARNING: space prohibited b=
etween function name and open parenthesis &#39;(&#39;<br>#1191: FILE: drive=
rs/message/fusion/mptlan.c:1191:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 printk (KERN_ERR &quot;%s: Can&#39;t alloc context\n&quot;,<b=
r><br>WARNING: space prohibited between function name and open parenthesis =
&#39;(&#39;<br>#1213: FILE: drivers/message/fusion/mptlan.c:1213:<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_WA=
RNING<br><br>WARNING: space prohibited between function name and open paren=
thesis &#39;(&#39;<br>#1252: FILE: drivers/message/fusion/mptlan.c:1252:<br=
>+/**/ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;=
/%s: No buckets posted\n&quot;,<br><br>WARNING: space prohibited between fu=
nction name and open parenthesis &#39;(&#39;<br>#1300: FILE: drivers/messag=
e/fusion/mptlan.c:1300:<br>+mpt_register_lan_device (MPT_ADAPTER *mpt_dev, =
int pnum)<br><br>WARNING: space prohibited between function name and open p=
arenthesis &#39;(&#39;<br>#1442: FILE: drivers/message/fusion/mptlan.c:1442=
:<br>+static int __init mpt_lan_init (void)<br><br>WARNING: space prohibite=
d between function name and open parenthesis &#39;(&#39;<br>#1449: FILE: dr=
ivers/message/fusion/mptlan.c:1449:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_=
ERR MYNAM &quot;: Failed to register with MPT base driver\n&quot;);<br><br>=
WARNING: space prohibited between function name and open parenthesis &#39;(=
&#39;<br>#1500: FILE: drivers/message/fusion/mptlan.c:1500:<br>+ =C2=A0 =C2=
=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;: %s: WARNING - Broadcast swap =
F/W bug detected!\n&quot;,<br><br>WARNING: space prohibited between functio=
n name and open parenthesis &#39;(&#39;<br>#1502: FILE: drivers/message/fus=
ion/mptlan.c:1502:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &qu=
ot;: Please update sender @ MAC_addr =3D %pM\n&quot;,<br><br><br>**BRACKET_=
SPACE**<br>Space prohibited before that close parenthesis &#39;)&#39;<br>It=
 not good practice to add spaces wherever not requireed line before the clo=
se<br>parenthesis.<br>To fix this we need to delete space character before =
close parathesis.<br><br>{scripts/<a href=3D"http://checkpatch.pl">checkpat=
ch.pl</a> code} <br>...<br># check for spaces before close parenthesis<br>i=
f ($line =3D~ /(\s+)\)/ &amp;&amp; $line !~ /^.\s*\)/ &amp;&amp;<br>=C2=A0 =
=C2=A0 $line !~ /for\s*\(.*;\s+\)/ &amp;&amp;<br>=C2=A0 =C2=A0 $line !~ /:\=
s+\)/) {<br>=C2=A0 =C2=A0 if (ERROR(&quot;SPACING&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;space prohibited before that close parenthesis &=
#39;)&#39;\n&quot; . $herecurr) &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
fix) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $fixed[$fixlinenr] =3D~<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s/\s+\)/\)/;<br>=C2=A0 =C2=A0 }<br>}<br>...=
<br><br>ERROR: space prohibited before that close parenthesis &#39;)&#39;<b=
r>#809: FILE: drivers/message/fusion/mptlan.c:809:<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOC_AND_NETDEV_NAMES_s_s(dev) ));<br><br><br=
><br>Possible unnecessary &#39;out of memory&#39; message<br>This messages =
are printed in kernel log , if it cannot allocate memory,<br>and since ther=
e will be alot of them this messages will also increase in<br>kernel log. H=
ence, it is required to minimize it.<br>To fix this instead of printing the=
 message we can return with ENOMEM.<br>ENOMEM is macro defined for &quot;ou=
t of memory&quot; error.<br><br>{scripts/<a href=3D"http://checkpatch.pl">c=
heckpatch.pl</a> code} <br>...<br># check for unnecessary &quot;Out of Memo=
ry&quot; messages<br>if ($line =3D~ /^\+.*\b$logFunctions\s*\(/ &amp;&amp;<=
br>=C2=A0 =C2=A0 $prevline =3D~ /^[ \+]\s*if\s*\(\s*(\!\s*|NULL\s*=3D=3D\s*=
)?($Lval)(\s*=3D=3D\s*NULL\s*)?\s*\)/ &amp;&amp;<br>=C2=A0 =C2=A0 (defined =
$1 || defined $3) &amp;&amp;<br>=C2=A0 =C2=A0 $linenr &gt; 3) {<br>=C2=A0 =
=C2=A0 my $testval =3D $2;<br>=C2=A0 =C2=A0 my $testline =3D $lines[$linenr=
 - 3];<br><br>=C2=A0 =C2=A0 my ($s, $c) =3D ctx_statement_block($linenr - 3=
, $realcnt, 0);<br># =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;line: &=
lt;$line&gt;\nprevline: &lt;$prevline&gt;\ns: &lt;$s&gt;\nc: &lt;$c&gt;\n\n=
\n&quot;);<br><br>=C2=A0 =C2=A0 if ($s =3D~ /(?:^|\n)[ \+]\s*(?:$Type\s*)?\=
Q$testval\E\s*=3D\s*(?:\([^\)]*\)\s*)?\s*$allocFunctions\s*\(/ &amp;&amp;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $s !~ /\b__GFP_NOWARN\b/ ) {<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 WARN(&quot;OOM_MESSAGE&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;Possible unnecessary &#39;out of memory&#39; mes=
sage\n&quot; . $hereprev);<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br>#865: FILE=
: drivers/message/fusion/mptlan.c:865:<br>+ =C2=A0 =C2=A0 =C2=A0 if (!skb) =
{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s=
/%s: ERROR - Can&#39;t allocate skb! (%s@%d)\n&quot;,<br><br>WARNING: Possi=
ble unnecessary &#39;out of memory&#39; message<br>#1213: FILE: drivers/mes=
sage/fusion/mptlan.c:1213:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (skb =3D=3D NULL) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING<br><br>WARNING: Possible unne=
cessary &#39;out of memory&#39; message<br>#1011: FILE: drivers/message/fus=
ion/mptlan.c:1011:<br>+ =C2=A0 =C2=A0 =C2=A0 if (!skb) {<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: ERROR - Can&#39=
;t allocate skb! (%s@%d)\n&quot;,<br><br>WARNING: Possible unnecessary &#39=
;out of memory&#39; message<br>#1053: FILE: drivers/message/fusion/mptlan.c=
:1053:<br>+ =C2=A0 =C2=A0 =C2=A0 if (!skb) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: ERROR - Can&#39;t allocate=
 skb! (%s@%d)\n&quot;,<br><br><br><br>Unnecessary cast may hide bugs, see <=
a href=3D"http://c-faq.com/malloc/mallocnocast.html">http://c-faq.com/mallo=
c/mallocnocast.html</a><br>casting is not require in this situation. It cou=
ld be difficult to trace bug if any in<br>there.Because compiler would =C2=
=A0suppress the warning due to casting.<br>Remove the extra casting syntax =
before the function call to fix this warning.<br><br>{scripts/<a href=3D"ht=
tp://checkpatch.pl">checkpatch.pl</a> code} <br>...<br># check for pointles=
s casting of alloc functions<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($line =3D~ =
/\*\s*\)\s*$allocFunctions\b/) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 WARN(&quot;UNNECESSARY_CASTS&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unnecessary cast may hide bugs, see <a=
 href=3D"http://c-faq.com/malloc/mallocnocast.html\n">http://c-faq.com/mall=
oc/mallocnocast.html\n</a>&quot; . $herecurr);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>...<br><br>WARNING: unnecessary cast may hide bugs, see <a href=3D=
"http://c-faq.com/malloc/mallocnocast.html">http://c-faq.com/malloc/mallocn=
ocast.html</a><br>#1009: FILE: drivers/message/fusion/mptlan.c:1009:<br>+ =
=C2=A0 =C2=A0 =C2=A0 skb =3D (struct sk_buff *)dev_alloc_skb(len);<br><br>W=
ARNING: unnecessary cast may hide bugs, see <a href=3D"http://c-faq.com/mal=
loc/mallocnocast.html">http://c-faq.com/malloc/mallocnocast.html</a><br>#10=
51: FILE: drivers/message/fusion/mptlan.c:1051:<br>+ =C2=A0 =C2=A0 =C2=A0 s=
kb =3D (struct sk_buff *)dev_alloc_skb(len);<br><br>WARNING: unnecessary ca=
st may hide bugs, see <a href=3D"http://c-faq.com/malloc/mallocnocast.html"=
>http://c-faq.com/malloc/mallocnocast.html</a><br>#863: FILE: drivers/messa=
ge/fusion/mptlan.c:863:<br>+ =C2=A0 =C2=A0 =C2=A0 skb =3D (struct sk_buff *=
)dev_alloc_skb(len);<br><br><br><br><br>This is code which never gonna exec=
ute or unreachable.So , it is pointless to<br>have it.<br>Delete that block=
 of code between #if 0 and #endif<br><br>{scripts/<a href=3D"http://checkpa=
tch.pl">checkpatch.pl</a> code} <br>...<br># warn about #if 0<br>if ($line =
=3D~ /^.\s*\#\s*if\s+0\b/) {<br>=C2=A0 =C2=A0 WARN(&quot;IF_0&quot;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Consider removing the code enclosed by=
 this #if 0 and its #endif\n&quot; . $herecurr);<br>}<br>...<br><br>WARNING=
: Consider removing the code enclosed by this #if 0 and its #endif<br>#188:=
 FILE: drivers/message/fusion/mptlan.c:188:<br>+#if 0<br><br><br><br><br>sp=
ace required after that &#39;,&#39; (ctx:VxV)<br>spacing is important where=
ver required, it the improves readablity of code.<br>Like comma &#39;,&#39;=
 =C2=A0acts like separator for tokens to compiler, spaces also help<br>us t=
o read it better while debugging. <br>To fix it insert space after &#39;,&#=
39;<br><br>{scripts/<a href=3D"http://checkpatch.pl">checkpatch.pl</a> code=
} <br>...<br>} elsif ($op eq &#39;,&#39;) {<br>=C2=A0 =C2=A0 ...<br>=C2=A0 =
=C2=A0 if ($ctx !~ /.x[WEC]/ &amp;&amp; $cc !~ /^}/) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (ERROR(&quot;SPACING&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;space required after that &#39;$op&#39; $at\n&qu=
ot; . $hereptr)) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $line_fixed=
 =3D 1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $last_after =3D $n;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $space_after =3D 1;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 }<br>...<br><br><br>ERROR: space re=
quired after that &#39;,&#39; (ctx:VxV)<br>#505: FILE: drivers/message/fusi=
on/mptlan.c:505:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;total_posted,ato=
mic_read(&amp;priv-&gt;buckets_out)));<br><br>ERROR: space required after t=
hat &#39;,&#39; (ctx:VxV)<br>#1087: FILE: drivers/message/fusion/mptlan.c:1=
087:<br>+ =C2=A0 =C2=A0 =C2=A0 skb_put(skb,len);<br><br><br><br>Spaces requ=
ired around that &#39;=3D=3D&#39; (ctx:VxV)<br>spacing is important whereve=
r required, it the improves readablity of code.<br>Inserting proper spaces =
like around &quot;=3D=3D&quot; is good practice.<br>To fix it insert space =
&#39; &#39; around &#39;=3D=3D&#39;<br><br>{scripts/<a href=3D"http://check=
patch.pl">checkpatch.pl</a> code} <br>...<br># All the others need spaces b=
oth sides.<br>} elsif ($ctx !~ /[EWC]x[CWE]/) {<br>=C2=A0 =C2=A0 my $ok =3D=
 0;<br><br>=C2=A0 =C2=A0 # Ignore email addresses &lt;foo@bar&gt;<br>=C2=A0=
 =C2=A0 if (($op eq &#39;&lt;&#39; &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$cc =3D~ /^\S+\@\S+&gt;/) ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ($op =
eq &#39;&gt;&#39; &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$ca =3D~ =
/&lt;\S+\@\S+$/))<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ok =3D=
 1;<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 # for asm volatile statements<b=
r>=C2=A0 =C2=A0 # ignore a colon with another<br>=C2=A0 =C2=A0 # colon imme=
diately before or after<br>=C2=A0 =C2=A0 if (($op eq &#39;:&#39;) &amp;&amp=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ($ca =3D~ /:$/ || $cc =3D~ /^:/)) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 $ok =3D 1;<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0=
 # messages are ERROR, but ?: are CHK<br>=C2=A0 =C2=A0 if ($ok =3D=3D 0) {<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $msg_level =3D \&amp;ERROR;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $msg_level =3D \&amp;CHK if (($op eq &#39;?:&#39; || $op =
eq &#39;?&#39; || $op eq &#39;:&#39;) &amp;&amp; $ctx =3D~ /VxV/);<br><br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (&amp;{$msg_level}(&quot;SPACING&quot;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;spaces=
 required around that &#39;$op&#39; $at\n&quot; . $hereptr)) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $good =3D rtrim($fix_elements[$n]) . &qu=
ot; &quot; . trim($fix_elements[$n + 1]) . &quot; &quot;;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (defined $fix_elements[$n + 2]) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $fix_elements[$n + 2] =3D~=
 s/^\s+//;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $line_fixed =3D 1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br>ERROR: spaces required around t=
hat &#39;=3D=3D&#39; (ctx:VxV)<br>#308: FILE: drivers/message/fusion/mptlan=
.c:308:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_phase=3D=3DMPT_IOC_SE=
TUP_RESET ? &quot;setup&quot; : (<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>ERROR: spaces required ar=
ound that &#39;=3D=3D&#39; (ctx:VxV)<br>#309: FILE: drivers/message/fusion/=
mptlan.c:309:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_phase=3D=3DMPT_=
IOC_PRE_RESET ? &quot;pre&quot; : &quot;post&quot;)));<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br><br>=
<br><br>No spaces at the start of a line.<br>Sometimes spaces can be redund=
ant, also it could decrease the code readablity.<br>Hence, it is also not g=
ood to insert wherever not recommended. Like begining or<br>end of each ins=
truction/statement.<br>Removing space from start of the line would fix this=
 issue<br><br>{scripts/<a href=3D"http://checkpatch.pl">checkpatch.pl</a> c=
ode} <br>...<br># check for spaces at the beginning of a line.<br># Excepti=
ons:<br># =C2=A01) within comments<br># =C2=A02) indented preprocessor comm=
ands<br># =C2=A03) hanging labels<br>if ($rawline =3D~ /^\+ / &amp;&amp; $l=
ine !~ /^\+ *(?:$;|#|$Ident:)/) =C2=A0{<br>=C2=A0 =C2=A0 my $herevet =3D &q=
uot;$here\n&quot; . cat_vet($rawline) . &quot;\n&quot;;<br>=C2=A0 =C2=A0 if=
 (WARN(&quot;LEADING_SPACE&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quo=
t;please, no spaces at the start of a line\n&quot; . $herevet) &amp;&amp;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $fix) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $fixed=
[$fixlinenr] =3D~ s/^\+([ \t]+)/&quot;\+&quot; . tabify($1)/e;<br>=C2=A0 =
=C2=A0 }<br>}<br>...<br><br>WARNING: please, no spaces at the start of a li=
ne<br>#723: FILE: drivers/message/fusion/mptlan.c:723:<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dma =3D pci_map_single(mpt_dev-&gt;pcidev, skb-&gt;data, skb-&=
gt;len,$<br><br><br><br>printk() should include KERN_&lt;LEVEL&gt; facility=
 level<br>Levels are important it helps to segregate while debugging using =
kernel log.<br>While printing kernel message we should include KERN_&lt;Lev=
el&gt; of message in printk<br>To fix it we require something like printk(K=
ERN_LEVEL, &quot;message&quot;);<br>KERN_LEVEl is level we want to use for =
that message to log in kernel log<br><br>{scripts/<a href=3D"http://checkpa=
tch.pl">checkpatch.pl</a> code} <br>...<br># printk should use KERN_* level=
s<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($line =3D~ /\bprintk\s*\(\s*(?!KERN_[A=
-Z]+\b)/) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN(&quot;PRINTK_=
WITHOUT_KERN_LEVEL&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;printk() should include KERN_&lt;LEVEL&gt; facility =
level\n&quot; . $herecurr);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>...<br><br>=
WARNING: printk() should include KERN_&lt;LEVEL&gt; facility level<br>#386:=
 FILE: drivers/message/fusion/mptlan.c:386:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printk (&quot;The ioc is active. Perhaps it needs to be&quot;<br=
><br>WARNING: printk() should include KERN_&lt;LEVEL&gt; facility level<br>=
#389: FILE: drivers/message/fusion/mptlan.c:389:<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 printk (&quot;The ioc in inactive, most likely in the &quot;<=
br><br><br><br>No space before tabs<br>It is totally redundant or wrong pra=
ctice to include spaces before tab.<br>If we can use tabs why we required s=
paces, it could mess up the things.<br>Deleting spaces before tab will fix =
this warning<br><br>{scripts/<a href=3D"http://checkpatch.pl">checkpatch.pl=
</a> code} <br>...<br># check for space before tabs.<br>if ($rawline =3D~ /=
^\+/ &amp;&amp; $rawline =3D~ / \t/) {<br>=C2=A0 =C2=A0 my $herevet =3D &qu=
ot;$here\n&quot; . cat_vet($rawline) . &quot;\n&quot;;<br>=C2=A0 =C2=A0 if =
(WARN(&quot;SPACE_BEFORE_TAB&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pl=
ease, no space before tabs\n&quot; . $herevet) &amp;&amp;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 $fix) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ($fixed[$fixline=
nr] =3D~<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s/(^\+.*=
) {$tabsize,$tabsize}\t/$1\t\t/) {}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 while ($=
fixed[$fixlinenr] =3D~<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s/(^\+.*) +\t/$1\t/) {}<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br>WARNING=
: please, no space before tabs<br>#1382: FILE: drivers/message/fusion/mptla=
n.c:1382:<br>+^IMPT_ADAPTER ^I^I*ioc =3D pci_get_drvdata(pdev);$<br><br>WAR=
NING: please, no space before tabs<br>#1428: FILE: drivers/message/fusion/m=
ptlan.c:1428:<br>+^IMPT_ADAPTER ^I^I*ioc =3D pci_get_drvdata(pdev);$<br><br=
><br>Code ident is improper here, after tab there is space at this two line=
s,<br>if we see the <br>WARNING: suspect code indent for conditional statem=
ents (0, 16)<br>#424: FILE: drivers/message/fusion/mptlan.c:424:<br>+/**/ =
=C2=A0 for (i =3D 0; i &lt; priv-&gt;tx_max_out; i++)<br>+/**/ =C2=A0 =C2=
=A0 =C2=A0 dlprintk((&quot; %xh&quot;, priv-&gt;mpt_txfidx[i]));<br><br>**C=
ODE_INDENT**<br>Code indent should use tabs where possible<br>Tabs should u=
se instead of spaces for code indent.<br>Replacing spaces with tab would fi=
x this issue.<br><br>...<br># at the beginning of a line any tabs must come=
 first and anything<br># more than $tabsize must use tabs.<br>if ($rawline =
=3D~ /^\+\s* \t\s*\S/ ||<br>=C2=A0 =C2=A0 $rawline =3D~ /^\+\s* =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\s*/) {<br>=C2=A0 =C2=A0 my $herevet =3D &quot;$here\n&quo=
t; . cat_vet($rawline) . &quot;\n&quot;;<br>=C2=A0 =C2=A0 $rpt_cleaners =3D=
 1;<br>=C2=A0 =C2=A0 if (ERROR(&quot;CODE_INDENT&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;code indent should use tabs where possible\n&quo=
t; . $herevet) &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $fix) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $fixed[$fixlinenr] =3D~ s/^\+([ \t]+)/&quot;\+&quot; .=
 tabify($1)/e;<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br>ERROR: code indent sho=
uld use tabs where possible<br>#723: FILE: drivers/message/fusion/mptlan.c:=
723:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0dma =3D pci_map_single(mpt_dev-&gt;pci=
dev, skb-&gt;data, skb-&gt;len,$<br><br>ERROR: code indent should use tabs =
where possible<br>#808: FILE: drivers/message/fusion/mptlan.c:808:<br>+^I =
=C2=A0 =C2=A0 =C2=A0 =C2=A0dioprintk((KERN_INFO MYNAM &quot;: %s/%s: Queued=
 post_buckets task.\n&quot;,$<br><br><br>**EMBEDDED_FUNCTION_NAME**<br>Pref=
er using &#39;&quot;%s...&quot;, __func__&#39; to using __func__, this func=
tion&#39;s name, in a string<br>The function name should not be mentioned a=
s constant but passed as variable __func__<br>which contains name of functi=
on. It will also help in future if changes need to be done<br>then it will =
fetch name dynamically.<br>To fix this it will be like printk(KERN_ERR MYNA=
M &quot;%s: Got a turbo reply&quot;,__func__);<br><br>...<br>if ($line =3D~=
 /^\+.*$String/ &amp;&amp;<br>=C2=A0 =C2=A0 defined($context_function) &amp=
;&amp;<br>=C2=A0 =C2=A0 get_quoted_string($line, $rawline) =3D~ /\b$context=
_function\b/ &amp;&amp;<br>=C2=A0 =C2=A0 length(get_quoted_string($line, $r=
awline)) !=3D (length($context_function) + 2)) {<br>=C2=A0 =C2=A0 WARN(&quo=
t;EMBEDDED_FUNCTION_NAME&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
Prefer using &#39;\&quot;%s...\&quot;, __func__&#39; to using &#39;$context=
_function&#39;, this function&#39;s name, in a string\n&quot; . $herecurr);=
<br>}<br>...<br><br>WARNING: Prefer using &#39;&quot;%s...&quot;, __func__&=
#39; to using &#39;lan_reply&#39;, this function&#39;s name, in a string<br=
>#223: FILE: drivers/message/fusion/mptlan.c:223:<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;/lan_reply: Got a turbo reply &=
quot;<br><br>WARNING: Prefer using &#39;&quot;%s...&quot;, __func__&#39; to=
 using &#39;lan_reply&#39;, this function&#39;s name, in a string<br>#179: =
FILE: drivers/message/fusion/mptlan.c:179:<br>+ =C2=A0 =C2=A0 =C2=A0 diopri=
ntk((KERN_INFO MYNAM &quot;: %s/%s: @lan_reply, tmsg %08x\n&quot;,<br><br>W=
ARNING: Prefer using &#39;&quot;%s...&quot;, __func__&#39; to using &#39;la=
n_reply&#39;, this function&#39;s name, in a string<br>#262: FILE: drivers/=
message/fusion/mptlan.c:262:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diopri=
ntk((KERN_INFO MYNAM &quot;@lan_reply: zero context &quot;<br><br>WARNING: =
Prefer using &#39;&quot;%s...&quot;, __func__&#39; to using &#39;lan_reply&=
#39;, this function&#39;s name, in a string<br>#283: FILE: drivers/message/=
fusion/mptlan.c:283:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot=
;/lan_reply: Got a non-turbo &quot;<br><br>WARNING: Prefer using &#39;&quot=
;%s...&quot;, __func__&#39; to using &#39;mpt_lan_close&#39;, this function=
&#39;s name, in a string<br>#499: FILE: drivers/message/fusion/mptlan.c:499=
:<br>+ =C2=A0 dlprintk((KERN_INFO MYNAM &quot;: mpt_lan_close called\n&quot=
;)); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br><br>WARNING: Prefer using &#39;&quot;%s...&=
quot;, __func__&#39; to using &#39;mpt_lan_receive_post_reply&#39;, this fu=
nction&#39;s name, in a string<br>#968: FILE: drivers/message/fusion/mptlan=
.c:968:<br>+ =C2=A0 dioprintk((KERN_INFO MYNAM &quot;: mpt_lan_receive_post=
_reply called\n&quot;));<br><br><br>Here we should prefer the use of repect=
ive subsystem printing function instead <br>of generalise one like printk()=
. Also we need to choose correct type of printing<br>function like for err =
we have e.g netdev_err() or for info we we have <br>e.g netdev_info(). So, =
to fix this issue we should pick correct type of printing<br>function of re=
spective subsystem. And if we do so, since we are using here<br>dedicated f=
unction, we could benifit from it while debugging.<br><br>...<br># prefer v=
ariants of (subsystem|netdev|dev|pr)_&lt;level&gt; to printk(KERN_&lt;LEVEL=
&gt;<br>if ($line =3D~ /\b(printk(_once|_ratelimited)?)\s*\(\s*KERN_([A-Z]+=
)/) {<br>=C2=A0 =C2=A0 my $printk =3D $1;<br>=C2=A0 =C2=A0 my $modifier =3D=
 $2;<br>=C2=A0 =C2=A0 my $orig =3D $3;<br>=C2=A0 =C2=A0 $modifier =3D &quot=
;&quot; if (!defined($modifier));<br>=C2=A0 =C2=A0 my $level =3D lc($orig);=
<br>=C2=A0 =C2=A0 $level =3D &quot;warn&quot; if ($level eq &quot;warning&q=
uot;);<br>=C2=A0 =C2=A0 my $level2 =3D $level;<br>=C2=A0 =C2=A0 $level2 =3D=
 &quot;dbg&quot; if ($level eq &quot;debug&quot;);<br>=C2=A0 =C2=A0 $level =
.=3D $modifier;<br>=C2=A0 =C2=A0 $level2 .=3D $modifier;<br>=C2=A0 =C2=A0 W=
ARN(&quot;PREFER_PR_LEVEL&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Prefer [subsystem eg: netdev]_$level2([subsystem]dev, ... then dev_$level2=
(dev, ... then pr_$level(... =C2=A0to $printk(KERN_$orig ...\n&quot; . $her=
ecurr);<br>}<br>...<br><br>WARNING: Prefer [subsystem eg: netdev]_err([subs=
ystem]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0to printk(KERN_E=
RR ...<br>#223: FILE: drivers/message/fusion/mptlan.c:223:<br><br>WARNING: =
Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ...=
 then pr_err(... =C2=A0to printk(KERN_ERR ...<br>#283: FILE: drivers/messag=
e/fusion/mptlan.c:283:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &qu=
ot;/lan_reply: Got a non-turbo &quot;<br><br>WARNING: Prefer [subsystem eg:=
 netdev]_warn([subsystem]dev, ... then dev_warn(dev, ... then pr_warn(... =
=C2=A0to printk(KERN_WARNING ...<br>#383: FILE: drivers/message/fusion/mptl=
an.c:383:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;/lan_o=
pen: lan_reset failed.&quot;);<br><br>WARNING: Prefer [subsystem eg: netdev=
]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(... =C2=A0to=
 printk(KERN_INFO ...<br>#431: FILE: drivers/message/fusion/mptlan.c:431:<b=
r>+ =C2=A0 printk(KERN_INFO MYNAM &quot;: %s/%s: interface up &amp; active\=
n&quot;,<br><br>WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev,=
 ... then dev_warn(dev, ... then pr_warn(... =C2=A0to printk(KERN_WARNING .=
..<br>#435: FILE: drivers/message/fusion/mptlan.c:435:<br>+ =C2=A0 =C2=A0 =
=C2=A0 printk (KERN_WARNING MYNAM &quot;/lo: Unable to register for Event&q=
uot;<br><br>WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ...=
 then dev_info(dev, ... then pr_info(... =C2=A0to printk(KERN_INFO ...<br>#=
543: FILE: drivers/message/fusion/mptlan.c:543:<br>+ =C2=A0 printk(KERN_INF=
O MYNAM &quot;: %s/%s: interface down &amp; inactive\n&quot;,<br><br>WARNIN=
G: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, =
... then pr_err(... =C2=A0to printk(KERN_ERR ...<br>#628: FILE: drivers/mes=
sage/fusion/mptlan.c:628:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM =
&quot;: %s/%s: ERROR - Invalid SGL sent to IOC!\n&quot;,<br><br>WARNING: Pr=
efer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... t=
hen pr_err(... =C2=A0to printk(KERN_ERR ...<br>#694: FILE: drivers/message/=
fusion/mptlan.c:694:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR &quot;%s: n=
o tx context available: %u\n&quot;,<br><br>WARNING: Prefer [subsystem eg: n=
etdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0=
to printk(KERN_ERR ...<br>#704: FILE: drivers/message/fusion/mptlan.c:704:<=
br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR &quot;%s: Unable to alloc reques=
t frame\n&quot;,<br><br>WARNING: Prefer [subsystem eg: netdev]_err([subsyst=
em]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0to printk(KERN_ERR =
...<br>#865: FILE: drivers/message/fusion/mptlan.c:865:<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: ERROR - Can&#39;=
t allocate skb! (%s@%d)\n&quot;,<br><br>WARNING: Prefer [subsystem eg: netd=
ev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0to =
printk(KERN_ERR ...<br>#978: FILE: drivers/message/fusion/mptlan.c:978:<br>=
+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: ERROR - Got a =
non-TURBO &quot;<br><br>WARNING: Prefer [subsystem eg: netdev]_err([subsyst=
em]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0to printk(KERN_ERR =
...<br>#981: FILE: drivers/message/fusion/mptlan.c:981:<br>+ =C2=A0 =C2=A0 =
=C2=A0 printk (KERN_ERR MYNAM &quot;: MsgFlags =3D %02x, IOCStatus =3D %04x=
\n&quot;,<br><br>WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev,=
 ... then dev_err(dev, ... then pr_err(... =C2=A0to printk(KERN_ERR ...<br>=
#1011: FILE: drivers/message/fusion/mptlan.c:1011:<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: ERROR - Can&#39;t a=
llocate skb! (%s@%d)\n&quot;,<br><br>WARNING: Prefer [subsystem eg: netdev]=
_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0to pri=
ntk(KERN_ERR ...<br>#1053: FILE: drivers/message/fusion/mptlan.c:1053:<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: E=
RROR - Can&#39;t allocate skb! (%s@%d)\n&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>WARNING: Prefer [subsyste=
m eg: netdev]_warn([subsystem]dev, ... then dev_warn(dev, ... then pr_warn(=
... =C2=A0to printk(KERN_WARNING ...<br>#1252: FILE: drivers/message/fusion=
/mptlan.c:1252:<br>+/**/ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_WA=
RNING MYNAM &quot;/%s: No buckets posted\n&quot;,<br><br>WARNING: Prefer [s=
ubsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then p=
r_info(... =C2=A0to printk(KERN_INFO ...<br>#1387: FILE: drivers/message/fu=
sion/mptlan.c:1387:<br>+ =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO MYNAM &quot;=
: %s: PortNum=3D%x, &quot;<br><br>WARNING: Prefer [subsystem eg: netdev]_in=
fo([subsystem]dev, ... then dev_info(dev, ... then pr_info(... =C2=A0to pri=
ntk(KERN_INFO ...<br>#1396: FILE: drivers/message/fusion/mptlan.c:1396:<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO MYNAM &quot;: %s: Hmm=
m... LAN protocol &quot;<br><br>WARNING: Prefer [subsystem eg: netdev]_err(=
[subsystem]dev, ... then dev_err(dev, ... then pr_err(... =C2=A0to printk(K=
ERN_ERR ...<br>#1404: FILE: drivers/message/fusion/mptlan.c:1404:<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR MYNAM &quot;: %s: Unable to=
 register &quot;<br><br>WARNING: Prefer [subsystem eg: netdev]_info([subsys=
tem]dev, ... then dev_info(dev, ... then pr_info(... =C2=A0to printk(KERN_I=
NFO ...<br>#1410: FILE: drivers/message/fusion/mptlan.c:1410:<br>+ =C2=A0 =
=C2=A0 =C2=A0 printk(KERN_INFO MYNAM &quot;: %s: Fusion MPT LAN device &quo=
t;<br><br>WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... t=
hen dev_info(dev, ... then pr_info(... =C2=A0to printk(KERN_INFO ...<br>#14=
12: FILE: drivers/message/fusion/mptlan.c:1412:<br>+ =C2=A0 =C2=A0 =C2=A0 p=
rintk(KERN_INFO MYNAM &quot;: %s/%s: &quot;<br><br>WARNING: Prefer [subsyst=
em eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(..=
. =C2=A0to printk(KERN_ERR ...<br>#1449: FILE: drivers/message/fusion/mptla=
n.c:1449:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: Failed t=
o register with MPT base driver\n&quot;);<br><br>WARNING: Prefer [subsystem=
 eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(... =
=C2=A0to printk(KERN_ERR ...<br>#1456: FILE: drivers/message/fusion/mptlan.=
c:1456:<br>+ =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR MYNAM &quot;: Eieee! unab=
le to register a reset &quot;<br><br>WARNING: Prefer [subsystem eg: netdev]=
_warn([subsystem]dev, ... then dev_warn(dev, ... then pr_warn(... =C2=A0to =
printk(KERN_WARNING ...<br>#1500: FILE: drivers/message/fusion/mptlan.c:150=
0:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;: %s: WARNING=
 - Broadcast swap F/W bug detected!\n&quot;,<br><br>WARNING: Prefer [subsys=
tem eg: netdev]_warn([subsystem]dev, ... then dev_warn(dev, ... then pr_war=
n(... =C2=A0to printk(KERN_WARNING ...<br>#1502: FILE: drivers/message/fusi=
on/mptlan.c:1502:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quo=
t;: Please update sender @ MAC_addr =3D %pM\n&quot;,<br><br>WARNING: Prefer=
 [subsystem eg: netdev]_warn([subsystem]dev, ... then dev_warn(dev, ... the=
n pr_warn(... =C2=A0to printk(KERN_WARNING ...<br>#1118: FILE: drivers/mess=
age/fusion/mptlan.c:1118:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MY=
NAM &quot; Mismatch between driver&#39;s &quot;<br><br>WARNING: Prefer [sub=
system eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_er=
r(... =C2=A0to printk(KERN_ERR ...<br>#1164: FILE: drivers/message/fusion/m=
ptlan.c:1164:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR &quo=
t;%s: Unable to alloc request frame\n&quot;,<br><br>WARNING: Prefer [subsys=
tem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(.=
.. =C2=A0to printk(KERN_ERR ...<br>#1191: FILE: drivers/message/fusion/mptl=
an.c:1191:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KE=
RN_ERR &quot;%s: Can&#39;t alloc context\n&quot;,<br><br>WARNING: Prefer [s=
ubsystem eg: netdev]_warn([subsystem]dev, ... then dev_warn(dev, ... then p=
r_warn(... =C2=A0to printk(KERN_WARNING ...<br>#1213: FILE: drivers/message=
/fusion/mptlan.c:1213:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 printk (KERN_WARNING<br><br>WARNING: Prefer [subsystem eg=
: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(... =C2=
=A0to printk(KERN_ERR ...<br>#1094: FILE: drivers/message/fusion/mptlan.c:1=
094:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: Yoohoo=
! mpt_rxfidx_tail =3D %d, &quot;<br><br>WARNING: Prefer [subsystem eg: netd=
ev]_warn([subsystem]dev, ... then dev_warn(dev, ... then pr_warn(... =C2=A0=
to printk(KERN_WARNING ...<br>#1104: FILE: drivers/message/fusion/mptlan.c:=
1104:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;: %s/%s: W=
ARNING - IOC out of buckets! &quot;<br><br>WARNING: Prefer [subsystem eg: n=
etdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(... =C2=
=A0to printk(KERN_INFO ...<br>#1109: FILE: drivers/message/fusion/mptlan.c:=
1109:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_INFO MYNAM &quot;: %s/%s: IOC =
says %d buckets left. &quot;<br><br><br>**TRAILING_WHITESPACES**<br>Trailin=
g whitespace<br>Trailing whitespaces at end of line is not standard practic=
e.<br>Deleting it would fix this issue from this file<br><br>...<br>trailin=
g whitespace<br>if ($line =3D~ /^\+.*\015/) {<br>=C2=A0 =C2=A0 my $herevet =
=3D &quot;$here\n&quot; . cat_vet($rawline) . &quot;\n&quot;;<br>=C2=A0 =C2=
=A0 if (ERROR(&quot;DOS_LINE_ENDINGS&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;DOS line endings\n&quot; . $herevet) &amp;&amp;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $fix) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $fixed[$fixlinenr]=
 =3D~ s/[\s\015]+$//;<br>=C2=A0 =C2=A0 }<br>} elsif ($rawline =3D~ /^\+.*\S=
\s+$/ || $rawline =3D~ /^\+\s+$/) {<br>=C2=A0 =C2=A0 my $herevet =3D &quot;=
$here\n&quot; . cat_vet($rawline) . &quot;\n&quot;;<br>=C2=A0 =C2=A0 if (ER=
ROR(&quot;TRAILING_WHITESPACE&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;trailing whitespace\n&quot; . $herevet) &amp;&amp;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 $fix) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $fixed[$fixlinenr] =3D=
~ s/\s+$//;<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 $rpt_cleaners =3D 1;<br=
>}<br>...<br><br>ERROR: trailing whitespace<br>#799: FILE: drivers/message/=
fusion/mptlan.c:799:<br>+^I$<br><br>ERROR: trailing whitespace<br>#1113: FI=
LE: drivers/message/fusion/mptlan.c:1113:<br>+^I$<br><br>ERROR: trailing wh=
itespace<br>#1117: FILE: drivers/message/fusion/mptlan.c:1117:<br>+^I^I$<br=
><br>ERROR: trailing whitespace<br>#1124: FILE: drivers/message/fusion/mptl=
an.c:1124:<br>+^I^I$<br><br>ERROR: trailing whitespace<br>#1128: FILE: driv=
ers/message/fusion/mptlan.c:1128:<br>+^I$<br><br>ERROR: trailing whitespace=
<br>#1409: FILE: drivers/message/fusion/mptlan.c:1409:<br>+^I^I$<br><br>ERR=
OR: trailing whitespace<br>#1416: FILE: drivers/message/fusion/mptlan.c:141=
6:<br>+^I$<br><br>ERROR: trailing whitespace<br>#1463: FILE: drivers/messag=
e/fusion/mptlan.c:1463:<br>+^I$<br><br><br>Quoted string split across lines=
<br>splited string across lines is not good aproach because it could affect=
 the<br>result of grep, while searching the error in kernel log.<br>To fix =
this there are multple options<br>=C2=A0 =C2=A0 1] try to use full line for=
 that string, till 80(max 100*) characters<br>=C2=A0 =C2=A0 2] shrunk the m=
essage that could fit in less 80(max 100*) characters line<br>=C2=A0 =C2=A0=
 3] use any of &#39;\n&#39;,&#39;\t&#39;,&#39;;&#39;,&#39;{&#39; character =
at the end of previous string<br><br>...<br>#check for user-visible strings=
 broken across lines, which breaks the ability<br># to grep for the string.=
=C2=A0 Make exceptions when the previous string ends in a<br># newline (mul=
tiple lines in one string constant) or &#39;\t&#39;, &#39;\r&#39;, &#39;;&#=
39;, or &#39;{&#39;<br># (common in inline assembly) or is a octal \123 or =
hexadecimal \xaf value<br>if ($line =3D~ /^\+\s*$String/ &amp;&amp;<br>=C2=
=A0 =C2=A0 $prevline =3D~ /&quot;\s*$/ &amp;&amp;<br>=C2=A0 =C2=A0 $prevraw=
line !~ /(?:\\(?:[ntr]|[0-7]{1,3}|x[0-9a-fA-F]{1,2})|;\s*|\{\s*)&quot;\s*$/=
) {<br>=C2=A0 =C2=A0 if (WARN(&quot;SPLIT_STRING&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;quoted string split across lines\n&quot; . $herep=
rev) &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fix &am=
p;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$prevrawline =3D=
~ /^\+.*&quot;\s*$/ &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$last_coalesced_string_linenr !=3D $linenr - 1) {<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br=
>WARNING: quoted string split across lines<br>#224: FILE: drivers/message/f=
usion/mptlan.c:224:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (KERN_ER=
R MYNAM &quot;/lan_reply: Got a turbo reply &quot;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;that I don&#39;t know what to do with=
\n&quot;);<br><br>WARNING: quoted string split across lines<br>#263: FILE: =
drivers/message/fusion/mptlan.c:263:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dioprintk((KERN_INFO MYNAM &quot;@lan_reply: zero context &quot;<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ReceivePostRe=
ply received.\n&quot;));<br><br>WARNING: quoted string split across lines<b=
r>#284: FILE: drivers/message/fusion/mptlan.c:284:<br>+ =C2=A0 =C2=A0 =C2=
=A0 printk (KERN_ERR MYNAM &quot;/lan_reply: Got a non-turbo &quot;<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;reply that I don&#39;t know what t=
o do with\n&quot;);<br><br>WARNING: quoted string split across lines<br>#38=
7: FILE: drivers/message/fusion/mptlan.c:387:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printk (&quot;The ioc is active. Perhaps it needs to be&quot;<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; reset?\n&quot;);=
<br><br>WARNING: quoted string split across lines<br>#390: FILE: drivers/me=
ssage/fusion/mptlan.c:390:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk (=
&quot;The ioc in inactive, most likely in the &quot;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;process of being reset. Please try ag=
ain in &quot;<br><br>WARNING: quoted string split across lines<br>#391: FIL=
E: drivers/message/fusion/mptlan.c:391:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;process of being reset. Please try again in &quo=
t;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a moment.\n&=
quot;);<br><br>WARNING: quoted string split across lines<br>#979: FILE: dri=
vers/message/fusion/mptlan.c:979:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_ER=
R MYNAM &quot;: %s/%s: ERROR - Got a non-TURBO &quot;<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;ReceivePostReply w/ PacketLength zero!\n&quot;,<=
br><br>WARNING: quoted string split across lines<br>#915: FILE: drivers/mes=
sage/fusion/mptlan.c:915:<br>+/**/ =C2=A0 dlprintk((KERN_INFO MYNAM &quot;/=
receive_post_reply: &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;IOC retur=
ned %d buckets, freeing them...\n&quot;, count));<br><br>WARNING: quoted st=
ring split across lines<br>#822: FILE: drivers/message/fusion/mptlan.c:822:=
<br>+ =C2=A0 dioprintk((KERN_INFO MYNAM &quot;: %s/%s: Incoming packet (%d =
bytes) &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;delivered to upper leve=
l.\n&quot;,<br><br>WARNING: quoted string split across lines<br>#806: FILE:=
 drivers/message/fusion/mptlan.c:806:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dioprintk((KERN_INFO MYNAM &quot;: post_buckets queued on &quot;<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;timer.\=
n&quot;));<br><br>WARNING: quoted string split across lines<br>#504: FILE: =
drivers/message/fusion/mptlan.c:504:<br>+ =C2=A0 dlprintk((KERN_INFO MYNAM =
&quot;:lan_close: Posted %d buckets &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;since driver was loaded, %d still out\n&quot;,<br><br>WARNING: quote=
d string split across lines<br>#436: FILE: drivers/message/fusion/mptlan.c:=
436:<br>+ =C2=A0 =C2=A0 =C2=A0 printk (KERN_WARNING MYNAM &quot;/lo: Unable=
 to register for Event&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
 Notifications. This is a bad thing! We&#39;re not going &quot;<br><br>WARN=
ING: quoted string split across lines<br>#437: FILE: drivers/message/fusion=
/mptlan.c:437:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; Notifications=
. This is a bad thing! We&#39;re not going &quot;<br>+ =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;to go ahead, but I&#39;d be leery of system stability =
at &quot;<br><br>WARNING: quoted string split across lines<br>#438: FILE: d=
rivers/message/fusion/mptlan.c:438:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;to go ahead, but I&#39;d be leery of system stability at &quot;<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;this point.\n&quot;);<br><br>WARN=
ING: quoted string split across lines<br>#838: FILE: drivers/message/fusion=
/mptlan.c:838:<br>+ =C2=A0 dioprintk((KERN_INFO MYNAM &quot;/receive_post_r=
eply: %d buckets &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remaining, %=
d received back since sod\n&quot;,<br><br>WARNING: quoted string split acro=
ss lines<br>#1095: FILE: drivers/message/fusion/mptlan.c:1095:<br>+ =C2=A0 =
=C2=A0 =C2=A0 printk (KERN_ERR MYNAM &quot;: %s/%s: Yoohoo! mpt_rxfidx_tail=
 =3D %d, &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;MPT_LAN_MAX_B=
UCKETS_OUT =3D %d\n&quot;,<br><br>WARNING: quoted string split across lines=
<br>#1105: FILE: drivers/message/fusion/mptlan.c:1105:<br>+ =C2=A0 =C2=A0 =
=C2=A0 printk (KERN_WARNING MYNAM &quot;: %s/%s: WARNING - IOC out of bucke=
ts! &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(priv-&gt;buckets_=
out =3D %d)\n&quot;,<br><br>WARNING: quoted string split across lines<br>#1=
110: FILE: drivers/message/fusion/mptlan.c:1110:<br>+ =C2=A0 =C2=A0 =C2=A0 =
printk (KERN_INFO MYNAM &quot;: %s/%s: IOC says %d buckets left. &quot;<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(priv-&gt;buckets_out =3D %d)\n&=
quot;,<br><br>WARNING: quoted string split across lines<br>#1457: FILE: dri=
vers/message/fusion/mptlan.c:1457:<br>+ =C2=A0 =C2=A0 =C2=A0 printk(KERN_ER=
R MYNAM &quot;: Eieee! unable to register a reset &quot;<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;handler with mptbase! The world is=
 at an end! &quot;<br><br>WARNING: quoted string split across lines<br>#145=
8: FILE: drivers/message/fusion/mptlan.c:1458:<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;handler with mptbase! The world is at an e=
nd! &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Every=
thing is fading to black! Goodbye.\n&quot;);<br><br>WARNING: quoted string =
split across lines<br>#1413: FILE: drivers/message/fusion/mptlan.c:1413:<br=
>+ =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO MYNAM &quot;: %s/%s: &quot;<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;LanAddr =3D %pM\n&quo=
t;,<br><br>WARNING: quoted string split across lines<br>#1411: FILE: driver=
s/message/fusion/mptlan.c:1411:<br>+ =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO =
MYNAM &quot;: %s: Fusion MPT LAN device &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;registered as &#39;%s&#39;\n&quot;, ioc-&g=
t;name, dev-&gt;name);<br><br>WARNING: quoted string split across lines<br>=
#1405: FILE: drivers/message/fusion/mptlan.c:1405:<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 printk(KERN_ERR MYNAM &quot;: %s: Unable to register &quo=
t;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;port%d as a LAN device\n&quot;, ioc-&gt;name,<br><br>WARNING: quoted strin=
g split across lines<br>#1397: FILE: drivers/message/fusion/mptlan.c:1397:<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO MYNAM &quot;: %s: =
Hmmm... LAN protocol &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;seems to be disabled on this adapter port!\n&quot=
;,<br><br>WARNING: quoted string split across lines<br>#1388: FILE: drivers=
/message/fusion/mptlan.c:1388:<br>+ =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO M=
YNAM &quot;: %s: PortNum=3D%x, &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;ProtocolFlags=3D%02Xh (%c%c%c%c)\n&quot;,<br><br>WAR=
NING: quoted string split across lines<br>#1370: FILE: drivers/message/fusi=
on/mptlan.c:1370:<br>+ =C2=A0 dlprintk((KERN_INFO MYNAM &quot;: Finished re=
gistering dev &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 &quot;and setting initial va=
lues\n&quot;));<br><br>WARNING: quoted string split across lines<br>#1119: =
FILE: drivers/message/fusion/mptlan.c:1119:<br>+ =C2=A0 =C2=A0 =C2=A0 print=
k (KERN_WARNING MYNAM &quot; Mismatch between driver&#39;s &quot;<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;buckets_out count and fw&#39;s Bucket=
sRemaining &quot;<br><br>WARNING: quoted string split across lines<br>#1120=
: FILE: drivers/message/fusion/mptlan.c:1120:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;buckets_out count and fw&#39;s BucketsRemaining &quot;<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;count has crossed the threshold,=
 issuing a &quot;<br><br>WARNING: quoted string split across lines<br>#1121=
: FILE: drivers/message/fusion/mptlan.c:1121:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;count has crossed the threshold, issuing a &quot;<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;LanReset to clear the fw&#39;s hashta=
ble. You may &quot;<br><br>WARNING: quoted string split across lines<br>#11=
22: FILE: drivers/message/fusion/mptlan.c:1122:<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;LanReset to clear the fw&#39;s hashtable. You may &quot=
;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;want to check your /var/log=
/messages for \&quot;CRC &quot;<br><br>WARNING: quoted string split across =
lines<br>#1123: FILE: drivers/message/fusion/mptlan.c:1123:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;want to check your /var/log/messages for \&q=
uot;CRC &quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;error\&quot; e=
vent notifications.\n&quot;);<br><br><br><br><br><br><br>else is not genera=
lly useful after a break or return<br>Here presence of else doesn&#39;t mat=
ter its optional, and better would be removing<br>it. Because, anyways else=
 part will get executed after if condition fails.<br>It&#39;s redundant.<br=
>removing the else and keeping apropriate indent would fix this issue.<br><=
br>...<br># check indentation of any line with a bare else<br># (but not if=
 it is a multiple line &quot;if (foo) return bar; else return baz;&quot;)<b=
r># if the previous line is a break or return and is indented 1 tab more...=
<br>if ($sline =3D~ /^\+([\t]+)(?:}[ \t]*)?else(?:[ \t]*{)?\s*$/) {<br>=C2=
=A0 =C2=A0 my $tabs =3D length($1) + 1;<br>=C2=A0 =C2=A0 if ($prevline =3D~=
 /^\+\t{$tabs,$tabs}break\b/ ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ($prevline =
=3D~ /^\+\t{$tabs,$tabs}return\b/ &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0defined $lines[$linenr] &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$lines[$linenr] !~ /^[ \+]\t{$tabs,$tabs}return/)) {<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 WARN(&quot;UNNECESSARY_ELSE&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;else is not generally useful after a break=
 or return\n&quot; . $hereprev);<br>=C2=A0 =C2=A0 }<br>}<br>...<br><br>WARN=
ING: else is not generally useful after a break or return<br>#304: FILE: dr=
ivers/message/fusion/mptlan.c:304:<br>+ =C2=A0 =C2=A0 =C2=A0 return(1);<br>=
+ =C2=A0 else<br><br><br>Braces {} are not necessary for any arm of this st=
atement<br>curly braces are optional if there is only of statement in if-el=
se block.<br>removing would not affect the functionality of program. It is =
sort of redundant.<br>To fix this warning remove the pair of curly braces =
=C2=A0{}<br><br>...<br># check for redundant bracing round if etc<br>if ($l=
ine =3D~ /(^.*)\bif\b/ &amp;&amp; $1 !~ /else\s*$/) {<br>=C2=A0 =C2=A0 my (=
$level, $endln, @chunks) =3D<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx_statement_f=
ull($linenr, $realcnt, 1);<br>=C2=A0 =C2=A0 #print &quot;chunks&lt;$#chunks=
&gt; linenr&lt;$linenr&gt; endln&lt;$endln&gt; level&lt;$level&gt;\n&quot;;=
<br>=C2=A0 =C2=A0 #print &quot;APW: &lt;&lt;$chunks[1][0]&gt;&gt;&lt;&lt;$c=
hunks[1][1]&gt;&gt;\n&quot;;<br>=C2=A0 =C2=A0 if ($#chunks &gt; 0 &amp;&amp=
; $level =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 my @allowed =3D ();<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $allow =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 my $seen =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $herectx =3D $here . &qu=
ot;\n&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $ln =3D $linenr - 1;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for my $chunk (@chunks) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 my ($cond, $block) =3D @{$chunk};<br><br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the condition carries leading newlines, t=
hen count those as offsets.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my=
 ($whitespace) =3D ($cond =3D~ /^((?:\s*\n[+-])*\s*)/s);<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $offset =3D statement_rawlines($whitespace) =
- 1;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $allowed[$allow] =3D =
0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #print &quot;COND&lt;$cond&=
gt; whitespace&lt;$whitespace&gt; offset&lt;$offset&gt;\n&quot;;<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We have looked at and allowed this=
 specific line.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $suppress_ifbr=
aces{$ln + $offset} =3D 1;<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 $herectx .=3D &quot;$rawlines[$ln + $offset]\n[...]\n&quot;;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ln +=3D statement_rawlines($block) - 1;<br=
><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 substr($block, 0, length($co=
nd), &#39;&#39;);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $seen++ =
if ($block =3D~ /^\s*{/);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
#print &quot;cond&lt;$cond&gt; block&lt;$block&gt; allowed&lt;$allowed[$all=
ow]&gt;\n&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (statement=
_lines($cond) &gt; 1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 #print &quot;APW: ALLOWED: cond&lt;$cond&gt;\n&quot;;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $allowed[$allow] =3D 1;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if ($block =3D~/\b(?:if|for|while)\b/) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #print &quot;APW: ALLOWED: block&lt;=
$block&gt;\n&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $allowed[$allow] =3D 1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (statement_block_size($bloc=
k) &gt; 1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #pr=
int &quot;APW: ALLOWED: lines block&lt;$block&gt;\n&quot;;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $allowed[$allow] =3D 1;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $allow++;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ($seen) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my $su=
m_allowed =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach (@all=
owed) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $sum_all=
owed +=3D $_;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($sum_allowed =3D=3D 0) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN(&quot;BRACES&quot;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;braces {} are not necessary for any arm of this statement\n&quot; =
. $herectx);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } elsif ($sum_all=
owed !=3D $allow &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0$seen !=3D $allow) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 CHK(&quot;BRACES&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;braces {} should be =
used on all arms of this statement\n&quot; . $herectx);<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =
=C2=A0 }<br>}<br>...<br><br>WARNING: braces {} are not necessary for any ar=
m of this statement<br>#1507: FILE: drivers/message/fusion/mptlan.c:1507:<b=
r>+ =C2=A0 =C2=A0 =C2=A0 if (!memcmp(fch-&gt;daddr, dev-&gt;broadcast, FC_A=
LEN)) {<br>[...]<br>+ =C2=A0 =C2=A0 =C2=A0 } else {<br>[...]<br><br>WARNING=
: braces {} are not necessary for any arm of this statement<br>#1513: FILE:=
 drivers/message/fusion/mptlan.c:1513:<br>+ =C2=A0 =C2=A0 =C2=A0 if (memcmp=
(fch-&gt;daddr, dev-&gt;dev_addr, FC_ALEN)) {<br>[...]<br>+ =C2=A0 =C2=A0 =
=C2=A0 } else {<br>[...]<br><div>=C2=A0<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
drivers/infiniband/hw/hfi1/sysfs.c<br></blockquote>$ ./scripts/<a href=3D"h=
ttp://checkpatch.pl">checkpatch.pl</a> drivers/infiniband/hw/hfi1/sysfs.c <=
br><br>**SPDX_LICENSE_TAG**<br>Missing or malformed SPDX-License-Identifier=
 tag.<br>Every file should contain &#39;SPDX-License-Identifier&#39; tag wh=
ich specifies<br>the which license it uses, like &#39;GPL-2.0&#39;. It was =
missing in this file,<br>but they mentioned the license in comments.<br>To =
fix this we need to use Tag and mention it like key value pair.<br>&quot;SP=
DX-License-Identifier:GPL-2.0&quot;<br><br>{scripts/<a href=3D"http://check=
patch.pl">checkpatch.pl</a> code} <br>...<br>if ($comment !~ /^$/ &amp;&amp=
;<br>=C2=A0 =C2=A0 $rawline !~ m@^\+\Q$comment\E SPDX-License-Identifier: @=
) {<br>=C2=A0 =C2=A0 =C2=A0 WARN(&quot;SPDX_LICENSE_TAG&quot;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Missing or malformed SPDX-License-I=
dentifier tag in line $checklicenseline\n&quot; . $herecurr);<br>} <br>...<=
br><br>WARNING: Missing or malformed SPDX-License-Identifier tag in line 1<=
br>#1: FILE: drivers/infiniband/hw/hfi1/sysfs.c:1:<br>+/*<br><br><br><br>Re=
turning string by sysfs_emit(...) should contain terminating newline.<br>Th=
at mean after the string new line character &#39;\n&#39; should be used.<br=
>To fix this after string format specifier &#39;%s&#39; we should use &#39;=
\n&#39; <br>It Will be something like<br>=C2=A0 =C2=A0 return sysfs_emit(bu=
f, &quot;%s\n&quot;, dd-&gt;boardversion);<br><br>{scripts/<a href=3D"http:=
//checkpatch.pl">checkpatch.pl</a> code} <br>...<br># return sysfs_emit(foo=
, fmt, ...) fmt without newline<br>		if ($line =3D~ /\breturn\s+sysfs_emit\=
s*\(\s*$FuncArg\s*,\s*($String)/ &amp;&amp;<br>		 =C2=A0 =C2=A0substr($rawl=
ine, $-[6], $+[6] - $-[6]) !~ /\\n&quot;$/) {<br>			my $offset =3D $+[6] - =
1;<br>			if (WARN(&quot;SYSFS_EMIT&quot;,<br>				 &quot;return sysfs_emit(.=
..) formats should include a terminating newline\n&quot; . $herecurr) &amp;=
&amp;<br>			 =C2=A0 =C2=A0$fix) {<br>				substr($fixed[$fixlinenr], $offset=
, 0) =3D &#39;\\n&#39;;<br>			}<br>		}<br>...<br><br>WARNING: return sysfs_=
emit(...) formats should include a terminating newline<br>#479: FILE: drive=
rs/infiniband/hw/hfi1/sysfs.c:479:<br>+ =C2=A0 return sysfs_emit(buf, &quot=
;%s&quot;, dd-&gt;boardversion);<br><br>WARNING: return sysfs_emit(...) for=
mats should include a terminating newline<br>#522: FILE: drivers/infiniband=
/hw/hfi1/sysfs.c:522:<br>+ =C2=A0 return sysfs_emit(buf, &quot;%s&quot;, dd=
-&gt;serial);<br><br><br>**NON_OCTAL_PERMISSIONS**<br>Symbolic permission a=
re not required here instead its equvivalent in Octal <br>representation.Si=
nce Octal is default representation. it also gives better<br>understanding =
of permission for user.<br><br>{scripts/<a href=3D"http://checkpatch.pl">ch=
eckpatch.pl</a> code} <br>...<br># check for uses of S_&lt;PERMS&gt; that c=
ould be octal for readability<br>		while ($line =3D~ m{\b($multi_mode_perms=
_string_search)\b}g) {<br>			my $oval =3D $1;<br>			my $octal =3D perms_to_=
octal($oval);<br>			if (WARN(&quot;SYMBOLIC_PERMS&quot;,<br>				 &quot;Symb=
olic permissions &#39;$oval&#39; are not preferred. Consider using octal pe=
rmissions &#39;$octal&#39;.\n&quot; . $herecurr) &amp;&amp;<br>			 =C2=A0 =
=C2=A0$fix) {<br>				$fixed[$fixlinenr] =3D~ s/\Q$oval\E/$octal/;<br>			}<b=
r>		}<br>...<br><br>WARNING: Symbolic permissions &#39;S_IWUSR | S_IRUGO&#3=
9; are not preferred. Consider using octal permissions &#39;0644&#39;.<br>#=
681: FILE: drivers/infiniband/hw/hfi1/sysfs.c:681:<br>+static SDE_ATTR(cpu_=
list, S_IWUSR | S_IRUGO,<br><br>WARNING: Symbolic permissions &#39;S_IRUGO&=
#39; are not preferred. Consider using octal permissions &#39;0444&#39;.<br=
>#684: FILE: drivers/infiniband/hw/hfi1/sysfs.c:684:<br>+static SDE_ATTR(vl=
, S_IRUGO, sde_show_vl, NULL);<br><div><br></div><div>-Vinesh Raut=C2=A0=C2=
=A0</div></div></div>

--000000000000a0e08905c8906cf1--

--===============4462984289105047312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4462984289105047312==--
