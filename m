Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C4FC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:13:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D987420781
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W796npJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D987420781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 465D58644F;
	Tue, 10 Nov 2020 18:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3y6-_oKnCaM; Tue, 10 Nov 2020 18:13:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A39786121;
	Tue, 10 Nov 2020 18:13:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B6CFC0889;
	Tue, 10 Nov 2020 18:13:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CE0EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 14F4A87192
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IRqB8cyDCucd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3044E87176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:13:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q5so9188560pfk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vRPURYkQeCjuCLsoHDlK3rPUEVdoNlyaQRalT65sdeY=;
 b=W796npJOcHPglKJvasC6Dkp489IKvfpLpKqAqwnFkJF2faib/rHuCONuLhycQMws9C
 26Zgrd4qZto9fO8Duj8gVBL8gPDlN9HpXW4d7/NrjNF+Xl/IdZmoyi1jTyyO2Av5ZHRu
 SzIrvviOn1yU9XgbdphbBjooAHdxqr7T6hNSudjyTt/xcEG9VB0PrmtFFgAFkRMxaalF
 8hZel9HoKEB3KJmlk2t8eJbH8WLRX/CqnfdpwPtM5Flskn/lFrTND3zSIMlk8w4APR/p
 XhZXAAknHeWkIMwr3ucC8MSl7DtzVxsA5Kxylckpu4c+CvsF0Cvk0/8YifvC4RF/0fi0
 54Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vRPURYkQeCjuCLsoHDlK3rPUEVdoNlyaQRalT65sdeY=;
 b=QUCQVFmNeiR+ZAkXg8U7LJCkZx7AwtznRzdJ1xj5proAUEwaqgvXDM1E5W47/8dOYJ
 3DxqE30GSdGgqx08x2ErElVp4UwPbUJeCyqap1Rwjyl9J/UHp5Qs78CG9ffW+KUJUlbO
 IEjehNTE/lShZveL+FJ4fBMAYqWn0LGSZfPWpIKLcOEPzctP/oEAAk/57b3pcARSAIsN
 noGOcU5HEhHzzDV/KTLfTRatY1jSFOCjdYwrhz0w/DfB2Sb3j00yLrepj1iIdiCKeXmz
 IWcmcsoZaHJ/IEcINIrtb0SWP7wG9494pel9h7vl7/iUlrfLvK2X5Gu4jO9xhRwvfOmH
 9GfQ==
X-Gm-Message-State: AOAM530o3szRy5kE3umfZ6C9VDfp0IIe0oiRRnlV/JzxZggsprexn9wP
 1sdeTyMmKa8nbu8COzK1ZzS9E28WNzcXrX35
X-Google-Smtp-Source: ABdhPJxuPQQqgPgBTIbzRlSHbuyuFDJDvF4FyswDKkZGBEYwxt0YfrE/0QdI89m5twn5R1VOQaAnsg==
X-Received: by 2002:a17:90b:345:: with SMTP id
 fh5mr376055pjb.198.1605032022394; 
 Tue, 10 Nov 2020 10:13:42 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id d18sm14753812pfo.133.2020.11.10.10.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 10:13:41 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201110130602.22359-1-yashsri421@gmail.com>
 <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
 <4291189c-4c65-4637-9b24-4ae00ac8a1a8@gmail.com>
 <CAKXUXMzdMuXaY02Lz2fvMyGBB+5vNxtT4XJemEGaZdYcXzrR0g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <d0a69d66-83e0-092e-af7b-dc63e04b0a9a@gmail.com>
Date: Tue, 10 Nov 2020 23:43:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzdMuXaY02Lz2fvMyGBB+5vNxtT4XJemEGaZdYcXzrR0g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On 10/11/20 8:52 pm, Lukas Bulwahn wrote:
> On Tue, Nov 10, 2020 at 4:13 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 10/11/20 7:30 pm, Lukas Bulwahn wrote:
>>> On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>>>> for the patch.
>>>>
>>>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
>>>> Completely remove --version flag") reports this error:
>>>>
>>>> ERROR: Missing Signed-off-by: line(s)
>>>>
>>>> Provide a fix by adding a Signed-off-by line corresponding to the author
>>>> of the patch before the patch separator line. Also avoid this error for
>>>> the commits where some typo is present in the sign off.
>>>>
>>>> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
>>>> for quirk") we get missing sign off as well as bad sign off for:
>>>>
>>>> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>>>>
>>>> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
>>>> signature and avoid MISSING_SIGN_OFF
>>>>
>>>> Suggested-by: Joe Perches <joe@perches.com>
>>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>>> ---
>>>> This patch was made after applying https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
>>>> and my last changes at https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
>>>>
>>>>  scripts/checkpatch.pl | 18 +++++++++++++++---
>>>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>> index cb46288127ac..2deffd0c091b 100755
>>>> --- a/scripts/checkpatch.pl
>>>> +++ b/scripts/checkpatch.pl
>>>> @@ -2404,6 +2404,8 @@ sub process {
>>>>
>>>>         my $last_blank_line = 0;
>>>>         my $last_coalesced_string_linenr = -1;
>>>> +       my $patch_separator_linenr = 0;
>>>> +       my $non_standard_signature = 0;
>>>>
>>>>         our @report = ();
>>>>         our $cnt_lines = 0;
>>>> @@ -2755,6 +2757,10 @@ sub process {
>>>>                 if ($line =~ /^---$/) {
>>>>                         $has_patch_separator = 1;
>>>>                         $in_commit_log = 0;
>>>> +                       # to add missing sign off line before diff(s)
>>>> +                       if($patch_separator_linenr == 0) {
>>>> +                               $patch_separator_linenr = $linenr;
>>>
>>> Well are you sure linenr is correct? (As I wrote, I do not know, but
>>> you should know.)
>>>
>>> I think you would need to create a patch for testing your feature
>>> where multiple things are fixed within the same patch and then check
>>> if the fix is added at the right place.
>>>
>>
>> I checked the fix over following patch.
>>
>> I have modified the patch such that it has co-developed-by as the
>> author(nominal patch author warning, which requires this line to be
>> deleted)
>>
>> Also 'occuring', which is a typo(where the typo needs to be replaced)
>>
>> It works as expected.
>>
> 
> Well to really check if it works as expected, you need to have a test
> patch where a fix adds multiple lines into the fixed patch before the
> line you try to record.
> 
> Then, fixlinenr and linenr are probably more than just 1 line apart,
> but really multiple lines apart and only if you record the right
> variable it really works.
> 

Actually we currently don't have any new line insertion fixes for
lines above patch separator.
So, I modified checkpatch a bit to insert (instead of delete) for
co-developed-by.
ie here:

if (WARN("BAD_SIGN_OFF",
	 "Co-developed-by: should not be used to attribute nominal patch
author '$author'\n" . "$here\n" . $rawline) &&
    $fix) {
-	fix_delete_line($fixlinenr, $rawline);
+	fix_insert_line($fixlinenr, $rawline);
}


When repeated a few times and removing signed-off-by, this provided an
experience of inserting multiple lines before signed-off-by (as for
each co-developed-by, it is inserting a new co-developed-by)

With this as well, the fix was working as expected, ie, got this after
some iterations of removing signed-off-by and keeping co-developed-by:

...
It is causing boot failures with qemu mac99 in at least some
configurations.occurring
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/32/hash.h | 8 ++++----


Aditya

> Other than that, it is all good.
> 
> Lukas
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
