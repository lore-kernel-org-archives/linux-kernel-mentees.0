Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390F2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 15:46:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D911860EE3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 15:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D911860EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947C2403BF;
	Mon,  2 Aug 2021 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuUNLPX5ixyE; Mon,  2 Aug 2021 15:46:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED4C9403EB;
	Mon,  2 Aug 2021 15:46:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5C6EC0010;
	Mon,  2 Aug 2021 15:46:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A306AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 15:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4CC607D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 15:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKBLi-rw8CTD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 15:46:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B8CD60642
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 15:46:30 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 190so16936571qkk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gp1fVUde0+ilYVSW3nzSLALmKDHwajJ5SVCcbVvpZqg=;
 b=ileJZosqj2iZB3wOGLfafW0Lnl6VdNDurJ9+2qpXi3SSP7/6ucY6WDZZUgfJlWVXxy
 rxpAufgd5EJ+1tfw7ZX2Uh4umnhnorbFUW6KTz+je1CM4XkoTGCIdEUJEEF2VrXgxvXX
 o6cgzhvkEDU1TOLVuQLVUnw4o2GGGbdv3dzZqf8S+OUwcf0186Eiheyg7UvxI7Bkso/h
 E7FhLEl8ENV8B2ik1Lk4ETrqppbXfl3TykFaVGsdVE5CI8D69RxCSHja2e2ceC+kG8m9
 d8IM94m39Xj3bEHIke7GzeBjUSxutpCf65ZuznLh7VKeGoFJJpyxKnfZY5hh5saG1+U8
 XUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gp1fVUde0+ilYVSW3nzSLALmKDHwajJ5SVCcbVvpZqg=;
 b=UmHPLJN40Yh2hjWlHsYPPk4qzuKGe6ARKMXspyDpPWVkrqVRlM5Z6SlQ7KNZykzNah
 g2iyA1RNK684bYX5sIw6G/DpvQPS99dlng/vFkIZqNRtsTcaWIXW9SlYgPvyTbxmB3DI
 X3CyYMR6xaoTlrhDl5scu/8Xj7yuj+KjNmsp8L+nAZgEvm4ON10GHdgtU9Lp8QngfQbg
 P8LNVIZFCNgySmW2n7HBHT+scqiVtC50yBksZStr0jv2LFs8AKkLfX71roZfiEDsIKFY
 HKxzaKedn0hjEWEZpv37WlnPK4fyrWwYt+NkbBqrZ4CbuhBlLkpinVrDUhAIlaiCU2Bi
 GvLQ==
X-Gm-Message-State: AOAM530+/3oOs2x4cEjEAffkG0700nUrz3Pt++q8bFzZHQGQEaywrRR/
 sKhiZW2JvDQIcPA+CBK0I0VnTRIjmZojaHG/Qig=
X-Google-Smtp-Source: ABdhPJyzWZomFVSMTqRQXpGk15QAAEG3gDNhpnAOuLav10LgGv3XhyEFebGODJBM7fxvOtI81YzEupSmj4yjN+1/Fks=
X-Received: by 2002:a37:a58f:: with SMTP id
 o137mr16020534qke.451.1627919188616; 
 Mon, 02 Aug 2021 08:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
 <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
In-Reply-To: <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Mon, 2 Aug 2021 21:16:08 +0530
Message-ID: <CAMqN5U5Dwd8Jya8ETOffHFtRxaecSHAqJCUjyi+hygjPuSzOFw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jul 20, 2021 at 11:26 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Then, the first task is to run checkpatch.pl on a few files below
> andshare the results:
>

Results are categories based on the type of Warnings or Errors

Format :
[Warnning/ Error message]
[Explanations]
[code which get invoked]
[list of warnings/errors of same type]

> drivers/message/fusion/mptlan.c
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
It's generally not useful and not standard practice to have the filename in the
file.
To fix this just delete that line number #2

{scripts/checkpatch.pl code}
...
# check for embedded filenames
if ($rawline =~ /^\+.*\Q$realfile\E/) {
      WARN("EMBEDDED_FILENAME",
         "It's generally not useful to have the filename in the
file\n" . $herecurr);
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
+/* Send a LanReset message to the FW. This should result in the FW returning
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
The block comment's ending token "*/" should end on next line not on the last
commented line.i.e closing (and also opening) comment tag should be on separated
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
+       dlprintk ((KERN_INFO "mptlan/ioc_reset: called
netif_stop_queue for %s.\n", dev->name));

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
+       dlprintk (("mptlan/tx_timeout: calling netif_wake_queue for
%s.\n", dev->name));
\
WARNING: space prohibited between function name and open parenthesis '('
#628: FILE: drivers/message/fusion/mptlan.c:628:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Invalid SGL sent to IOC!\n",

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
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

WARNING: space prohibited between function name and open parenthesis '('
#978: FILE: drivers/message/fusion/mptlan.c:978:
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Got a non-TURBO "

WARNING: space prohibited between function name and open parenthesis '('
#981: FILE: drivers/message/fusion/mptlan.c:981:
+       printk (KERN_ERR MYNAM ": MsgFlags = %02x, IOCStatus = %04x\n",

WARNING: space prohibited between function name and open parenthesis '('
#1011: FILE: drivers/message/fusion/mptlan.c:1011:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

WARNING: space prohibited between function name and open parenthesis '('
#1053: FILE: drivers/message/fusion/mptlan.c:1053:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

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
+       printk (KERN_ERR MYNAM ": Failed to register with MPT base driver\n");

WARNING: space prohibited between function name and open parenthesis '('
#1500: FILE: drivers/message/fusion/mptlan.c:1500:
+       printk (KERN_WARNING MYNAM ": %s: WARNING - Broadcast swap F/W
bug detected!\n",

WARNING: space prohibited between function name and open parenthesis '('
#1502: FILE: drivers/message/fusion/mptlan.c:1502:
+       printk (KERN_WARNING MYNAM ": Please update sender @ MAC_addr = %pM\n",


**BRACKET_SPACE**
Space prohibited before that close parenthesis ')'
It not good practice to add spaces wherever not requireed line before the close
parenthesis.
To fix this we need to delete space character before close parathesis.

{scripts/checkpatch.pl code}
...
# check for spaces before close parenthesis
if ($line =~ /(\s+)\)/ && $line !~ /^.\s*\)/ &&
    $line !~ /for\s*\(.*;\s+\)/ &&
    $line !~ /:\s+\)/) {
    if (ERROR("SPACING",
          "space prohibited before that close parenthesis ')'\n" . $herecurr) &&
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
\+]\s*if\s*\(\s*(\!\s*|NULL\s*==\s*)?($Lval)(\s*==\s*NULL\s*)?\s*\)/
&&
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
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

WARNING: Possible unnecessary 'out of memory' message
#1213: FILE: drivers/message/fusion/mptlan.c:1213:
+               if (skb == NULL) {
+                   printk (KERN_WARNING

WARNING: Possible unnecessary 'out of memory' message
#1011: FILE: drivers/message/fusion/mptlan.c:1011:
+       if (!skb) {
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

WARNING: Possible unnecessary 'out of memory' message
#1053: FILE: drivers/message/fusion/mptlan.c:1053:
+       if (!skb) {
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",



Unnecessary cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
casting is not require in this situation. It could be difficult to
trace bug if any in
there.Because compiler would  suppress the warning due to casting.
Remove the extra casting syntax before the function call to fix this warning.

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




This is code which never gonna execute or unreachable.So , it is pointless to
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
        $msg_level = \&CHK if (($op eq '?:' || $op eq '?' || $op eq
':') && $ctx =~ /VxV/);

        if (&{$msg_level}("SPACING",
                  "spaces required around that '$op' $at\n" . $hereptr)) {
            $good = rtrim($fix_elements[$n]) . " " .
trim($fix_elements[$n + 1]) . " ";
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
Sometimes spaces can be redundant, also it could decrease the code readablity.
Hence, it is also not good to insert wherever not recommended. Like begining or
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
While printing kernel message we should include KERN_<Level> of
message in printk
To fix it we require something like printk(KERN_LEVEL, "message");
KERN_LEVEl is level we want to use for that message to log in kernel log

{scripts/checkpatch.pl code}
...
# printk should use KERN_* levels
        if ($line =~ /\bprintk\s*\(\s*(?!KERN_[A-Z]+\b)/) {
            WARN("PRINTK_WITHOUT_KERN_LEVEL",
                 "printk() should include KERN_<LEVEL> facility
level\n" . $herecurr);
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
+^I        dioprintk((KERN_INFO MYNAM ": %s/%s: Queued post_buckets task.\n",$


**EMBEDDED_FUNCTION_NAME**
Prefer using '"%s...", __func__' to using __func__, this function's
name, in a string
The function name should not be mentioned as constant but passed as
variable __func__
which contains name of function. It will also help in future if
changes need to be done
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
         "Prefer using '\"%s...\", __func__' to using
'$context_function', this function's name, in a string\n" .
$herecurr);
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

WARNING: Prefer using '"%s...", __func__' to using 'mpt_lan_close',
this function's name, in a string
#499: FILE: drivers/message/fusion/mptlan.c:499:
+   dlprintk((KERN_INFO MYNAM ": mpt_lan_close called\n"));
                ^

WARNING: Prefer using '"%s...", __func__' to using
'mpt_lan_receive_post_reply', this function's name, in a string
#968: FILE: drivers/message/fusion/mptlan.c:968:
+   dioprintk((KERN_INFO MYNAM ": mpt_lan_receive_post_reply called\n"));


Here we should prefer the use of repective subsystem printing function instead
of generalise one like printk(). Also we need to choose correct type of printing
function like for err we have e.g netdev_err() or for info we we have
e.g netdev_info(). So, to fix this issue we should pick correct type of printing
function of respective subsystem. And if we do so, since we are using here
dedicated function, we could benifit from it while debugging.

...
# prefer variants of (subsystem|netdev|dev|pr)_<level> to printk(KERN_<LEVEL>
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
         "Prefer [subsystem eg: netdev]_$level2([subsystem]dev, ...
then dev_$level2(dev, ... then pr_$level(...  to $printk(KERN_$orig
...\n" . $herecurr);
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
+       printk (KERN_ERR MYNAM ": %s/%s: ERROR - Invalid SGL sent to IOC!\n",

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
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

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
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1053: FILE: drivers/message/fusion/mptlan.c:1053:
+           printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate
skb! (%s@%d)\n",
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
+       printk (KERN_ERR MYNAM ": Failed to register with MPT base driver\n");

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
#1456: FILE: drivers/message/fusion/mptlan.c:1456:
+       printk(KERN_ERR MYNAM ": Eieee! unable to register a reset "

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1500: FILE: drivers/message/fusion/mptlan.c:1500:
+       printk (KERN_WARNING MYNAM ": %s: WARNING - Broadcast swap F/W
bug detected!\n",

WARNING: Prefer [subsystem eg: netdev]_warn([subsystem]dev, ... then
dev_warn(dev, ... then pr_warn(...  to printk(KERN_WARNING ...
#1502: FILE: drivers/message/fusion/mptlan.c:1502:
+       printk (KERN_WARNING MYNAM ": Please update sender @ MAC_addr = %pM\n",

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
    2] shrunk the message that could fit in less 80(max 100*) characters line
    3] use any of '\n','\t',';','{' character at the end of previous string

...
#check for user-visible strings broken across lines, which breaks the ability
# to grep for the string.  Make exceptions when the previous string ends in a
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
Here presence of else doesn't matter its optional, and better would be removing
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
             "else is not generally useful after a break or return\n"
. $hereprev);
    }
}
...

WARNING: else is not generally useful after a break or return
#304: FILE: drivers/message/fusion/mptlan.c:304:
+       return(1);
+   else


Braces {} are not necessary for any arm of this statement
curly braces are optional if there is only of statement in if-else block.
removing would not affect the functionality of program. It is sort of redundant.
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

            # If the condition carries leading newlines, then count
those as offsets.
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

./scripts/checkpatch.pl drivers/infiniband/hw/hfi1/sysfs.c

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
"return sysfs_emit(...) formats should include a terminating
newline\n" . $herecurr) &&
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

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider
using octal permissions '0444'.
#684: FILE: drivers/infiniband/hw/hfi1/sysfs.c:684:
+static SDE_ATTR(vl, S_IRUGO, sde_show_vl, NULL);

> Dwaipayan.

- Vinesh Raut
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
