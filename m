Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8518EC56201
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 11:09:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C920F20756
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 11:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuI7BvyN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C920F20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37C8D8752B;
	Wed, 11 Nov 2020 11:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glujSZMVvUIT; Wed, 11 Nov 2020 11:09:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9ADEB874CB;
	Wed, 11 Nov 2020 11:09:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF02C0889;
	Wed, 11 Nov 2020 11:09:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F4028C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6E692A163
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cxo5yB3DxL1G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:09:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 19A2E228EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:09:34 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 62so1213201pgg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sByY2OvAaT/H3gvT3BLVuYjmUPC1XvQi52xpeyAO4Jc=;
 b=FuI7BvyNGtACkk1D23zYS56f/cUaCWJ/bOeGSW91XCx+LuUL2i9qdN/ETxtdBGUPIA
 tb9GfjxXZGl5ZV6JQ2X8FaMcJHgpgUz2m1UqSDxCkoqS/a37Xk5NHKVpONTxfLM9Zkgd
 /99sdlhoIyTz63s0kWnE6jYWI+h4tUOh4tiHaNNRI8uvcO+eVxCZT2lVrDnfMZmfCsfR
 Bs2iblIDL56PfToSHS9GX+YiiNZA2AAA+zL9BNO0Ap2GFEl/858VFTgStA2mse5YUNVp
 PERE7qx/RmF4Nho4a660Hhz4fUBrlIfTjMi8Q6SexD2lNJqtWsoyv4CnRBnyTzkQytRQ
 J3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sByY2OvAaT/H3gvT3BLVuYjmUPC1XvQi52xpeyAO4Jc=;
 b=Drd4bi+asAMd2gNvchcaVyLTUqVCgGYJ/8ywWG421IrVpXRGMprGEPh7n6rqQVn/Xt
 j1WDq4G+zSgIJem9vwPfjNrhGA6+XbybXH/aVvpM7sduHdQZkFORVK/K9LxAm681fF5r
 9JaYw5Od94XWwXpMpv3qX62gjJfj7UoqdZsBdeQ793cqwjI67r6+rqdNj47lRVv7nSXP
 9HiABVvzg9OoC2yWnt9haLs7ppLy7h6VCxIEqDdND15oJgX7UZAe6vWQtwwCPhOVkJZH
 +wMdz4SCdYezTSzzSciWUlMmOZ0pul/cc7CAXcRgSowDX+hOHNAdYNFEpsSilcAVpBLk
 P1jQ==
X-Gm-Message-State: AOAM531VB5DPjb1snDB1//c2YIQ7AaEEraHGsWN6/LBhsxZIB7mkwQLm
 3Y0B3GaV9c46xedUpKKJLyw=
X-Google-Smtp-Source: ABdhPJwj77gEOrvqKYrfDfRZVc4d90j01rRqqHqyjozwT/sAU2K0PJxMlG4LYP7/r2SX3fqTELdfow==
X-Received: by 2002:a62:7883:0:b029:18a:e054:edf1 with SMTP id
 t125-20020a6278830000b029018ae054edf1mr22365958pfc.70.1605092973449; 
 Wed, 11 Nov 2020 03:09:33 -0800 (PST)
Received: from ?IPv6:2402:3a80:41c:a166:90d7:ac69:6d50:789e?
 ([2402:3a80:41c:a166:90d7:ac69:6d50:789e])
 by smtp.gmail.com with ESMTPSA id w16sm2236330pfn.45.2020.11.11.03.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:09:33 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201111090143.9230-1-yashsri421@gmail.com>
 <CAKXUXMzg6Wg310s-N8hWOEiXFkg1ZAga+NkFQkFQ5_bS16TLnA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <2b640e8b-69dc-2ade-3b9f-fae14eed1b17@gmail.com>
Date: Wed, 11 Nov 2020 16:39:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzg6Wg310s-N8hWOEiXFkg1ZAga+NkFQkFQ5_bS16TLnA@mail.gmail.com>
Content-Language: en-US
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for MISSING_SIGN_OFF
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

On 11/11/20 4:00 pm, Lukas Bulwahn wrote:
> On Wed, Nov 11, 2020 at 10:01 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>> for the patch.
>>
>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
>> Completely remove --version flag") reports this error:
>>
>> ERROR: Missing Signed-off-by: line(s)
>>
>> Provide a fix by adding a Signed-off-by line corresponding to the author
>> of the patch before the patch separator line. Also avoid this error for
>> the commits where some typo is present in the sign off.
>>
>> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
>> for quirk") we get missing sign off as well as bad sign off for:
>>
>> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>>
>> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
>> signature and avoid MISSING_SIGN_OFF
>>
>> Suggested-by: Joe Perches <joe@perches.com>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>> Changes in v2:
>> Add space after 'if'
>> Add check for $patch_separator_linenr to be greater than 0
>>
>>  scripts/checkpatch.pl | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index cb46288127ac..ac7e5ac80b58 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2404,6 +2404,8 @@ sub process {
>>
>>         my $last_blank_line = 0;
>>         my $last_coalesced_string_linenr = -1;
>> +       my $patch_separator_linenr = 0;
>> +       my $non_standard_signature = 0;
>>
>>         our @report = ();
>>         our $cnt_lines = 0;
>> @@ -2755,6 +2757,10 @@ sub process {
>>                 if ($line =~ /^---$/) {
>>                         $has_patch_separator = 1;
>>                         $in_commit_log = 0;
>> +                       # to add missing sign off line before diff(s)
>> +                       if ($patch_separator_linenr == 0) {
>> +                               $patch_separator_linenr = $linenr;
>> +                       }
>>                 }
>>
>>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
>> @@ -2775,6 +2781,9 @@ sub process {
>>                         if ($sign_off !~ /$signature_tags/) {
>>                                 WARN("BAD_SIGN_OFF",
>>                                      "Non-standard signature: $sign_off\n" . $herecurr);
>> +
>> +                               # to avoid missing_sign_off error as it most probably is just a typo
>> +                               $non_standard_signature = 1;
>>                         }
>>                         if (defined $space_before && $space_before ne "") {
>>                                 if (WARN("BAD_SIGN_OFF",
>> @@ -7118,9 +7127,12 @@ sub process {
>>                       "Does not appear to be a unified-diff format patch\n");
>>         }
>>         if ($is_patch && $has_commit_log && $chk_signoff) {
>> -               if ($signoff == 0) {
>> -                       ERROR("MISSING_SIGN_OFF",
>> -                             "Missing Signed-off-by: line(s)\n");
>> +               if ($signoff == 0 && !$non_standard_signature) {
>> +                       if (ERROR("MISSING_SIGN_OFF",
>> +                                 "Missing Signed-off-by: line(s)\n") &&
>> +                           $fix && $patch_separator_linenr > 0) {
>> +                               fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
>> +                       }
> 
> Maybe I am already digging too much in the details... however:
> 
> I think it should still warn about a Missing Signed-off-by: even when
> we know there is a $non_standard_signature. So, checkpatch simply
> emits two warnings; that is okay in that case.
> 
> It is just that our evaluation shows that the provided fix option
> should not be suggested when there is a $non_standard_signature
> because we actually would predict that there is typo in the intended
> Signed-off-by tag and the fix that checkpatch would suggest would not
> be adequate.
> 
> Joe, what is your opinion?
> 
> Aditya, it should not be too difficult to implement the rule that way, right?
> 

No, I'd probably just have to add the check with $fix, instead of with
$signoff

Thanks
Aditya

> 
>>                 } elsif ($authorsignoff != 1) {
>>                         # authorsignoff values:
>>                         # 0 -> missing sign off
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
