Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C011DC56202
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 21:30:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138972240A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 21:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqTUxvDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138972240A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6419F87224;
	Fri, 20 Nov 2020 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubxjmk6deGCW; Fri, 20 Nov 2020 21:30:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D91AC871D7;
	Fri, 20 Nov 2020 21:30:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF2D8C1825;
	Fri, 20 Nov 2020 21:30:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7D5FC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 21:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AD627871DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 21:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZZLT+VC20KG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 21:30:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ED036871D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 21:30:15 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id l11so5540844plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 13:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5ZriXLCRVmm8wil9E+hAP9jdbiqfQ9p7y0QQGSsyShI=;
 b=qqTUxvDfU1DaeMVqAV1tW6UKH4iRPAM+EVX/nsyH8IXSJEXogDNCaqTBWiS9t8Qcql
 KCYgqzO8cjmWDR/cmjY7XalJWoUdbxDJU7t9itVllW9bW2n/EPG3jv3iGyFXMo97mUw8
 Gd3Fqf37DIoScwD6bTSkIxh9sjl7qljV4fdKXGHvtReR9JsnTWZ0osvM7+OFXLuCPU11
 QFKSQ3Fjag7UL+KddXg0iOMvoc/8+u7GLphw5oYA8xK+lvtS1QJg08LjoJLkwrDW2Wcp
 RmyeADBaAK6gNRp/itYEwIsYhTM9NrPPngxx0QUVXNAd+NI2WgxEDvl2JOec+moKGq/I
 +AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5ZriXLCRVmm8wil9E+hAP9jdbiqfQ9p7y0QQGSsyShI=;
 b=ZL8mlicfT4sVZvzp2oULwos7lHdyihN8+IXzOeyTkyN8g4nvQbj+7fw4Q2Cqe7zujj
 nJu/kDF3AM+JvlbR3nM+OoNwt26rrP6IantE5it41PqLoJOB4/muGHPq7Xchd0OnPON0
 RibbIxjZ3nDBXESuEWGpB2zcvfvgzGpValZurBJs4dkycz2mzCs7qkVYIrEwCik9W+zU
 BgQYd5KGNVLprSF4Z/nwwaPVY4lo001S1hx+XkPgivrjd6cvs3Wc7SlxYy7HB6hSTXFc
 in9RvGjwg6dt3nyy0pAyaCrFb2hA9cD0pXv8EJNsklGHRa+z4FEJpgStfLdw64ueR/Wh
 T9Mg==
X-Gm-Message-State: AOAM5310WTSKmjFZoJzZnLszLYw8PRafxvcePiuIewZhu5hrFFF5vdOk
 BTY6fRx+vRiA1yTBoypZ5T8YeYOQqRwnaQ==
X-Google-Smtp-Source: ABdhPJzzsaL3WOaIXtmh3QafADOkQXCGrkCBzWw8OfO8yM+/AJlBpgx1lvdMXShYVMtqh2r9+bRsKw==
X-Received: by 2002:a17:902:bb8c:b029:d9:261:5809 with SMTP id
 m12-20020a170902bb8cb02900d902615809mr14564199pls.29.1605907815156; 
 Fri, 20 Nov 2020 13:30:15 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:f607:e09e:f6d6:daa6:f3cd?
 ([2402:3a80:415:f607:e09e:f6d6:daa6:f3cd])
 by smtp.gmail.com with ESMTPSA id b22sm4826907pju.44.2020.11.20.13.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 13:30:14 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <da375716-721c-e4d8-27a9-f8d576741d65@gmail.com>
 <20201120195851.23679-1-yashsri421@gmail.com>
 <3fbf54ea-20f4-8e80-2bfd-363e9cec6619@gmail.com>
 <CAKXUXMwC-+BrDuCELNwZV_Qz1FDPXZKT_mTePOjZcjOXAviacw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <4230063e-48b5-8b0c-c92c-fc3e16b5ddb4@gmail.com>
Date: Sat, 21 Nov 2020 03:00:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwC-+BrDuCELNwZV_Qz1FDPXZKT_mTePOjZcjOXAviacw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix and improve
 warning msg for Non-standard signature
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

On 21/11/20 1:53 am, Lukas Bulwahn wrote:
> On Fr., 20. Nov. 2020 at 21:03, Aditya <yashsri421@gmail.com> wrote:
> 
>> On 21/11/20 1:28 am, Aditya Srivastava wrote:
>>> Checkpatch.pl warns on non-standard signature styles.
>>>
>>> E.g., running checkpatch on commit 513f7f747e1c ("parisc: Fix vmap
>>> memory leak in ioremap()/iounmap()") reports this warning:
>>>
>>> WARNING: Non-standard signature: Noticed-by:
>>> Noticed-by: Sven Schnelle <svens@stackframe.org>
>>>
> 
> 
> This example really does not tell anyone much.
> 
> Replace it with a summary from your evaluation.
> 
Okay

> 
>>> Provide a fix by:
>>> 1) replacing the non-standard signature with its standard equivalent
>>> 2) removing the signature if it is not required
>>>
>>> Also, improve warning messages correspondingly, providing users
>>> suggestions to either replace or remove the signature
>>>
> 
> 
> Looks good.
> 
> 
> 
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 45 +++++++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 43 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index fdfd5ec09be6..23a21dc2c29a 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -506,6 +506,27 @@ our $signature_tags = qr{(?xi:
>>>       Cc:
>>>  )};
>>>
>>> +our %standard_signature_fix = (
>>> +     "Requested-by:" => "Suggested-by:",
>>> +     "Co-authored-by:" => "Co-developed-by:",
>>> +     "Analyzed-by:" => "Co-developed-by:",
>>> +     "Analysed-by:" => "Co-developed-by:",
>>> +     "Improvements-by:" => "Co-developed-by:",
>>> +     "Noticed-by:" => "Reported-by:",
>>> +     "Inspired-by:" => "Suggested-by:",
>>> +     "Verified-by:" => "Tested-by:",
>>> +     "Okay-ished-by:" => "Acked-by:",
>>> +     "Acked-for-MFD-by:" => "Acked-by:",
>>> +     "Reviewed-off-by:" => "Reviewed-by:",
>>> +     "Proposed-by:" => "Suggested-by:",
>>> +     "Fixed-by:" => "Co-developed-by:",
>>> +     "Pointed-out-by:" => "Suggested-by:",
>>> +     "Pointed-at-by:" => "Suggested-by:",
>>> +     "Suggestions-by:" => "Suggested-by:",
>>> +     "Generated-by:" => "remove",
>>> +     "Celebrated-by:" => "remove",
>>> +);
>>> +
> 
> 
> How did create this list? I thought we looked at 30 cases...
> 
> 
Yes, correct. Others are the cases which required discussion like:
"Originally-by" and its variants (including 'Based-on-patch-by', etc),
"Bisected-by", "Diagnosed-by", "Root-caused-by".

Thanks
Aditya

>>>  our @typeListMisordered = (
>>>       qr{char\s+(?:un)?signed},
>>>       qr{int\s+(?:(?:un)?signed\s+)?short\s},
>>> @@ -2773,8 +2794,28 @@ sub process {
>>>                       my $ucfirst_sign_off = ucfirst(lc($sign_off));
>>>
>>>                       if ($sign_off !~ /$signature_tags/) {
>>> -                             WARN("BAD_SIGN_OFF",
>>> -                                  "Non-standard signature: $sign_off\n"
>> . $herecurr);
>>> +                             my $suggested_signature = "";
>>> +                             if
>> (exists($standard_signature_fix{$sign_off})) {
>>> +                                     $suggested_signature =
>> $standard_signature_fix{$sign_off};
>>> +                             }
>>> +                             if ($suggested_signature eq "") {
>>> +                                     WARN("BAD_SIGN_OFF",
>>> +                                          "Non-standard signature:
>> $sign_off\n" . $herecurr);
>>> +                             }
>>> +                             elsif ($suggested_signature eq "remove") {
>>> +                                     if (WARN("BAD_SIGN_OFF",
>>> +                                             "Non-standard signature:
>> $sign_off. Please consider removing this signature tag.\n" . $herecurr) &&
>>> +                                     $fix) {
>>> +
>>  fix_delete_line($fixlinenr, $rawline);
>>> +                                     }
>>> +                             }
>>> +                             else {
>>> +                                     if (WARN("BAD_SIGN_OFF",
>>> +                                             "Non-standard signature:
>> $sign_off. Please use '$suggested_signature' instead.\n" . $herecurr) &&
>>> +                                     $fix) {
>>> +                                             $fixed[$fixlinenr] =~
>> s/$sign_off/$suggested_signature/;
>>> +                                     }
>>> +                             }
>>>                       }
>>>                       if (defined $space_before && $space_before ne "") {
>>>                               if (WARN("BAD_SIGN_OFF",
>>>
>>
>> Initial tests performed on patches found this fix to be working as
>> expected.
>>
>> Thanks
>> Aditya
>>
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
