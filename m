Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_FAIL,SPF_HELO_NONE,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1017BC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 16:36:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 646222074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 16:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WONSlW/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 646222074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3DAD86F88;
	Mon,  9 Nov 2020 16:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCuDhI1lmhrX; Mon,  9 Nov 2020 16:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53EE686F58;
	Mon,  9 Nov 2020 16:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39A4BC088B;
	Mon,  9 Nov 2020 16:36:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC657C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 16:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A498786502
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 16:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbCwObLGfcba
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 16:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29573864CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 16:36:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 10so8669732pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WYpWnS3iRbRvQV/8J356r2V+wr/MjWdXQj/RsYfHbuY=;
 b=WONSlW/xJqTjUCCBrSktNGXvK0W98ZPTFMgsEVwtschUAAm2yT1jcCwnHZp2i4Anl2
 crvE8AO4p2ynO+Jl3jaf4zBHkO+WsOE3pGxQzPCo4xHFTVXH2ZbeAwOsOLRPGFemaHkI
 9qQ2c1RVDWaq+GGV3gkd4nFvHLqppMzupays3IPM6zD4Ol6XT92UGYIrXHmWIeoxaJI5
 IywTvZvrHxLlpV+e4Q7PNut0+/EWCJQ4aW6S6mjKPep3qPLVZQtE6k44Qz2xSeqehJ90
 W9BHeoQLG5IZX/K2x/TBsdk8EWyF1wV6WvKL3BkDCzr93hbAOLzTIkOEfAlKuP3H+zvv
 udOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WYpWnS3iRbRvQV/8J356r2V+wr/MjWdXQj/RsYfHbuY=;
 b=r2iWAEk7lDHYJOJIOr1ZevO5OfF0Vaecj//z0t1W4NJ/U1cyWHsp7VVUYI0sXLMU4G
 dilWtEDL/WelFmYETmgfX5MeexJpiC3T9G10MIrDDpNiQ6JQu2+5jqKoH/VDAmuRKtoQ
 BiuOrrr8M13DL/X3mMVPSQLel8gteY1Rm0IOPVr7OqOy5VpA2xGqdfylqETfw+wpL5cq
 R5oxeGwfJojTFyyFgAXI24g7By7aFhchKV6yn43TMmKLsR/TlSvdTOEHaevjsO5FEAGB
 bHTkZfduymvJeePGUTDWtUujgVXhgjHVjnrRgcuBcXaPVq+C/TGJLKjman3i/oRUA+PP
 L1fw==
X-Gm-Message-State: AOAM5318IHmkY5TMN6xFKFQT8lt1+6r4a03L5KXroEl7bwasVo00o1b+
 7et4oNfI4JRHZJE27K/MAe9kGJl4JkFA+g==
X-Google-Smtp-Source: ABdhPJz/27DrxSqDejbU/RXGwIFwOjdBQBit8gPOYVg4wQuKu0qqlNGjdlmWjuVYjJGjFX26oJctBQ==
X-Received: by 2002:a17:90a:8086:: with SMTP id
 c6mr137634pjn.147.1604939759334; 
 Mon, 09 Nov 2020 08:35:59 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:19be:b84e:68cf:38c6:95bd?
 ([2402:3a80:415:19be:b84e:68cf:38c6:95bd])
 by smtp.gmail.com with ESMTPSA id s5sm8304053pfh.164.2020.11.09.08.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 08:35:58 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201109131040.19266-1-yashsri421@gmail.com>
 <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
 <292a3930-9515-2387-40d3-63a14a61250b@gmail.com>
 <CAKXUXMwCT2DcE9iFQXfkaEuDpWW_yG=O2HuW-Vz3ek6Lsx25Lg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b1c10804-5d49-bb17-a228-66644a997961@gmail.com>
Date: Mon, 9 Nov 2020 22:05:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwCT2DcE9iFQXfkaEuDpWW_yG=O2HuW-Vz3ek6Lsx25Lg@mail.gmail.com>
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

On 9/11/20 8:15 pm, Lukas Bulwahn wrote:
> On Mon, Nov 9, 2020 at 3:33 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 9/11/20 7:10 pm, Lukas Bulwahn wrote:
>>> On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
>>> wrote:
>>>
>>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>>>> for the patch.
>>>>
>>>> E.g., running checkpatch on commit f68e7927212f ("Revert
>>>> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
>>>> reports this error:
>>>>
>>>> ERROR: Missing Signed-off-by: line(s)
>>>>
>>>> Provide a fix by adding a Signed-off-by line corresponding to the author
>>>> of the patch before the start of diff(s)
>>>>
>>>
>>> Can you please provide an evaluation first?
>>>
>>> As far as remember, the fix is often not to add a Signed-off-by: tag but it
>>> requires something completely different.
>>>
>>
>> I have generated the 'git logs' of the commits causing
>> MISSING_SIGN_OFF at:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task7/summary_log.txt
>>
>> Actually this fix was suggested by Joe at:
>> https://lore.kernel.org/linux-kernel-mentees/e8fef5fbd71331b010988769b249af6a79048f48.camel@perches.com/
>>
> 
> Yes I know. Now look at the reports.
> 
> The rc and release commit tags do not get a Signed-off-by
> intentionally. Other than that, reverts (for reverts is probably best
> to explain how to do a revert... so that a sign-off-by is included)
> and typos.
> 
> 
> Lukas
> 

Yes, I agree. But for the typos, the user must get BAD_SIGN_OFF
warning for "Non-standard signature". So user will have to fix that
manually. If so, this error is already avoided.

For the release commits, I think the user(s) may not use checkpatch

For the rest (ie reverts) with no sign-offs, I think that if we just
add the sign off line, it serves our purpose.
Of course if we explain them to revert with sign-off, it will be
probably the same outcome.

Thus, I feel that we can proceed with this fix for this class of error.
What do you think/suggest?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
