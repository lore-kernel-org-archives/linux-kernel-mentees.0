Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A60C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 15:59:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4B923433
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 15:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4B923433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDBAA86C2B;
	Wed,  9 Dec 2020 15:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7OkAuen5+sCI; Wed,  9 Dec 2020 15:59:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C240686CE6;
	Wed,  9 Dec 2020 15:59:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADFE2C0893;
	Wed,  9 Dec 2020 15:59:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A45FC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 363B58764E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fraQ5dosK4Vj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:59:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0EA087648
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:59:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 11so1293126pfu.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DTmR1i35Pp9kZnwtzH86QaYbrPpdWqqEcpcCEpssEn4=;
 b=tEIw5bB/e2148s3LohrBWKkX4jWcfCutJ/GF4dlhh0COCaLTZ90VOjwBm5V/odfyBY
 asZv81/YMW4c2dULBpTMn10bto3gtYHn1jZvSi6/vfxwOfct0cmlekMQT9fHBMtfH21A
 5oSvwE/Ohzy66m91h1ZP7y1yzskntyOaaNI06s/sNY4q03uZfz7RywzVhAtZF8R+YiRq
 t5kDtE5i3ce5CVTcyumCHWTiBwe+XBEsUl9L07852UuES10OS8kKJAU6rt49J6r9UpvZ
 mcRzyIG9KXvXdPu4+KHmXeBGxgBcQw7dBqX2CcyNLCZJQW8r0FI3vjqQRoNe7+oAAXq1
 ZRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DTmR1i35Pp9kZnwtzH86QaYbrPpdWqqEcpcCEpssEn4=;
 b=fBF8aOzE5VOzqf9MlcZGbuXpEKi2Hs7MUQsO+WkuaT+xlAMRkTAooT6F+ZLrEkWWQP
 nIP1DjYhzlIQwWrhbjuWFCp9p+GkLmqp0IhdLrZ0k7fIMlTSWIhA7+TqCDjHjm1pvtJM
 s0BzvnMm3/vTf6wUU7aQsW9GdBQk7RDtQ8PnbVuqWYVr0uBnVysJ4DOFDv8S+WOLkbza
 2H7Ycib0js8R4k2rdGhb6MRpHFO3tQfchw3FZQg2xc23i3EhnSIulzlOlSgGwlWLzYS2
 kk1Qt3j79UpXFboYdrtesSJtT1mFiytcH7+6PTV06VHwStUGIC6g1Mtpq7dMl3o38Xz+
 mXAw==
X-Gm-Message-State: AOAM532hTaSPDSTI2F3cSGL1wxjLodyp/LI23CWxXvmeO8as3KwFMUoy
 uQosDIPFGoOn0obneCnIPpIxmrdPJA34Gg==
X-Google-Smtp-Source: ABdhPJxyOZELi/r5ad5BnA1+lfdtQcyJxDmKVrprlY7WQ0h5CazMghcpwouJN0nnmqDOySUBZt1yWg==
X-Received: by 2002:a63:5748:: with SMTP id h8mr2501046pgm.24.1607529592898;
 Wed, 09 Dec 2020 07:59:52 -0800 (PST)
Received: from ?IPv6:2402:3a80:405:5180:6502:c162:a66c:507f?
 ([2402:3a80:405:5180:6502:c162:a66c:507f])
 by smtp.gmail.com with ESMTPSA id k18sm2626844pjz.26.2020.12.09.07.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:59:52 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201209105833.9066-1-yashsri421@gmail.com>
 <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <bc8f9d46-1474-5470-aca4-c4470761efb6@gmail.com>
Date: Wed, 9 Dec 2020 21:29:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option and
 improve msg for BOOL_COMPARISON
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

On 9/12/20 5:17 pm, Lukas Bulwahn wrote:
> On Wed, Dec 9, 2020 at 11:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently, checkpatch warns if the user compares expression with boolean.
>>
>> E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
>> hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:
>>
>> CHECK: Using comparison to true is error prone
>> +       if (ret == true)
>>
>> Provide a fix by replacing the expression with preferred expression. i.e.,
>>
>> 1) If the check is for a 'true' or 'not false' expression, the operand
>> will get replaced with empty string.
>>
>> 2) Else, the operand gets replaced with '!', and the arguments follow.
>>
> 
> Can you show the test cases you used to test this?
> 
Yes, I ran it over certain commits.

Eg 1) commit 5c789e131cbb ("netfilter: nf_conncount: Add list lock and
gc worker, and RCU for init tree search"), where

1.i)
+	if (list->dead == true) {
gets changed to:
+	if (list->dead) {

1.ii)
+		if (rbconn->list.count == 0 && rbconn->list.dead == false) {
gets changed to:
+		if (rbconn->list.count == 0 && !rbconn->list.dead) {

E.g. 2) commit 83ee6ec7740b75dc0db (Staging: rtl8723bs: os_dep: Fix
if-else coding style issues) where

2.i)
+	if (padapter->bDriverStopped == true) {
gets changed to:
+	if (padapter->bDriverStopped) {

2.ii)
+	if (pwrpriv->bInSuspend == true) {
gets changed to:
+	if (pwrpriv->bInSuspend) {

2.iii)
+	if (pwrpriv->bInSuspend == false) {
gets changed to:
+	if (!pwrpriv->bInSuspend) {

> Can you show all findings of this rule on the current rc or linux-next?
> 

I have generated report on last 10k commits of latest next branch,
where the check was found to be reported 5 times.

Here are the generated msgs:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/last_10k.txt

I have also generated the new CHK messages for BOOL_COMPARISON (over
v4.13..v5.8) at:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/commitsv4.13..v5.8.txt

which might give us a better idea for what how the lines will be replaced.

Thanks
Aditya

> Lukas
> 
>> Suggested-by: Joe Perches <joe@perches.com>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>> This fix is actually inspired from the comment mentioned in the script by Joe. I have added the Suggested-by line correspondingly.
>>
>>  scripts/checkpatch.pl | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 8bd8e4518f7f..abd5a3d2e913 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -6973,8 +6973,11 @@ sub process {
>>                                         $op = "";
>>                                 }
>>
>> -                               CHK("BOOL_COMPARISON",
>> -                                   "Using comparison to $otype is error prone\n" . $herecurr);
>> +                               if (CHK("BOOL_COMPARISON",
>> +                                       "Using comparison to '$otype' is error prone. Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr) &&
>> +                                   $fix) {
>> +                                       $fixed[$fixlinenr] =~ s/\b(?:true|false|$Lval)\s*(?:==|\!=)\s*(?:true|false|$Lval)\b/$op$arg/;
>> +                               }
>>
>>  ## maybe suggesting a correct construct would better
>>  ##                                 "Using comparison to $otype is error prone.  Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr);
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
