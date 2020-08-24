Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90BEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 18:05:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B6020702
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 18:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t8xtbXqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B6020702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3700C21551;
	Mon, 24 Aug 2020 18:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Gpte4lncVDZ; Mon, 24 Aug 2020 18:05:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E454E2154E;
	Mon, 24 Aug 2020 18:05:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3D67C016F;
	Mon, 24 Aug 2020 18:05:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3E8FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C9C0E87E99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfqnwWokCB8q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:05:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3578587D05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 18:05:06 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id v2so8090621ilq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ObWPiPRcqmTIc1MPbhxvSzYXyLC5ugMfZJjMDexYbdE=;
 b=t8xtbXqVDmUsUDGY6R/MW5TE62wNDsGBgvFN0CZYHYTR0RFrJLYMGUAxDZBgkrEd3X
 dlaaf+JsxI4aIUELuacKmZwqGZYhoQqxyp1g0SHvqsWVeEHiwJZwRpZ6KrKPgFBKF+VV
 8W1XzS4eLk3p4CZN6fQkWJLnNKjqJr0ntgL30sH8ANxTxzesr7srt3GbfF1aejGSt28T
 qsvZwW1BKHKQAlafC4oin6ONT7uKC4JWZezflFSnq4IjjlDK7pWlkIBBIoYVbfB1rUJj
 7pxEkqhus0xmyJsqJaF5DpT5QhhFfxVXPxPDJ7zilhrzH5hiQfCloQ9dffWEJg32kw+l
 3dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObWPiPRcqmTIc1MPbhxvSzYXyLC5ugMfZJjMDexYbdE=;
 b=sFydKitspXcROFp0XYNHPx+mpk2nNWsFZlnViMuXnp0m3E0/klGb5HuPzfqp4RFT1m
 HvqWKAuau73Q8Yq2CgIQ3zrjh4RSkcnTJvgf/hn53LvbICkV7Fa7aUVRH0f23Z5vHjfj
 4IT5GSYRpgMW5TD9yyLMSkmM1Lr2IDyMlFoMdoYeZ5qUIj5Q+V2Qql/e2SJtOnykjK/+
 Mcw0SbUVX7lOGOMtIAJO8kTHecNAgC9eveP+i2N2cu5aGaY0AT0d+SEAotjM2UyN6DMV
 tqU14VAePSxxfsukujFih5uGpvGvg0vL4XtRJZUSMxjuqA5tqBCnj4P0etlD1g7oYGoF
 6Wcg==
X-Gm-Message-State: AOAM532ZltVxalAAlbqzCPcuu1YD1aB2lQY5RPvIhA6/hpLRmH/HtMXD
 813rQ1jTCX32GbyWS7IqWQdAUEKm1pJyAiRQn+I=
X-Google-Smtp-Source: ABdhPJwetkExbidDJb3CdOreqWjQRH1wgFrfuDI8CjrgN07R+voTDrVl+b4X0xti0fxlTXGmmcTzwIdJ28TH7VaoRwE=
X-Received: by 2002:a92:bb54:: with SMTP id w81mr5711046ili.24.1598292305319; 
 Mon, 24 Aug 2020 11:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACFir3g8CPiN=63am0aLfEU3n9Ft5+ZQ_qJUHQGqqzj96ePHBA@mail.gmail.com>
 <CACFir3jGNRKgcmdAHYDFeLJeO2mXokG5p6yc0WPS0qwCEKNJ6Q@mail.gmail.com>
 <CAKXUXMx81VxEGEzOX1zhh7ZdGsFGASVMn2Xn9e_MMXyNKjHtRQ@mail.gmail.com>
 <CACFir3jhPhyU1kVkQdzgQ+e4Lq8aqZeT3+dZ6ZsW2b7L9RrBeA@mail.gmail.com>
 <CAKXUXMxqv_bz+FL1Nckq2FD8gMs9Ymmw3j2MukJKsmgX5ambNA@mail.gmail.com>
 <CACFir3iwBLcZoS8UqOy4qvtf8gRaQgbvhHWyCREk4XD-ap+BsQ@mail.gmail.com>
 <CAKXUXMy6waZDaEPWY8g5yyASkoVgCgz6caBqxkZpMMELWOHOcw@mail.gmail.com>
 <CACFir3jUvTFfoF5CxLw3NSAy+bfLx+9qmaJHMoSpFcC0SPsChw@mail.gmail.com>
 <CAKXUXMxJdUiR_u6Kh=5SC-i7yc0fo=2JD_syaEPmQwNHCo57ng@mail.gmail.com>
 <CACFir3i0jt6e=PWn64Hvwg91Lb2i2eNhhqdoPJjAZvmEVvk6Og@mail.gmail.com>
 <alpine.DEB.2.21.2008221926190.6653@felia>
 <CACFir3hREjmsjDoz0t3f3+jenEhqknwNvpdihPsidYY0kMVXPQ@mail.gmail.com>
In-Reply-To: <CACFir3hREjmsjDoz0t3f3+jenEhqknwNvpdihPsidYY0kMVXPQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 24 Aug 2020 20:04:54 +0200
Message-ID: <CAKXUXMzL8WXHbSinWdM01qdQFjnZ30SuBf3Df8uWYH7RMuKHZA@mail.gmail.com>
To: Jay Rajput <jay24rajput@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Community Bridge Klever Project
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

On Mon, Aug 24, 2020 at 7:53 PM Jay Rajput <jay24rajput@gmail.com> wrote:
>>
>> Okay, all good. The task in this mentorship is to make CodeChecker import
>> the results from coccinelle into the UI.
>>
>> Look at:
>> https://github.com/Ericsson/codechecker/tree/master/tools/report-converter
>>
>> If you can write a first simple report-converter for coccinelle and your
>> prototype shows that you understand what needs to be done, we can devise a
>> plan to make a full-fledged proper implementation with documentation,
>> tests etc. If the plan is solid, I am happy to mentor you through these
>> tasks.
>> If your implementation works, the rough workflow should be:
>>
>> make coccicheck > coccicheck_output
>> report-converter -o coccicheck_report -t coccinelle coccicheck_output
>> CodeChecker server &
>> CodeChecker store ./coccicheck_report -n linux
>>
>> Then, we should see the coccinelle findings nicely presented in the UI.
>>
>> Of course, it might be possible to modify coccinelle, provide parameters
>> to the build target to simplify the parser to be implemented in
>> CodeChecker.
>>
>> If that is not clear, we go back one step in the introduction process of
>> the task.
>
>
> Hello Lukas,
>
> I have looked into the code for report checker and I have devised the workflow and plan for extracting the errors in the document below:
> https://docs.google.com/document/d/1Hbo4REffUS6IN2KzAKB-zAIlvUGO43Rx4adzVnG6HwM/edit?usp=sharing
>
> For the prototype, I would make a basic parser that could extract the error files from the coccinelle output and display it, is that correct? If there is something more please let me know
>

Show that you can program that parser properly in CodeChecker and
share your branch on github to test it.

I am quite sure you did not look at the code yet; your proposal is
just abstract. If you would have looked at the code, you would know
much more specific which data structure is required for CodeChecker to
store it properly in the database.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
