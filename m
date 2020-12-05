Return-Path: <SRS0=9kH0=FJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82024C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 15:55:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D6E23158
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 15:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D6E23158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E969E8769F;
	Sat,  5 Dec 2020 15:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2utb+TwVunId; Sat,  5 Dec 2020 15:55:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF86987465;
	Sat,  5 Dec 2020 15:55:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5C9CC0FA8;
	Sat,  5 Dec 2020 15:55:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4060EC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2D9CC22708
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4xvcvKCt+6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by silver.osuosl.org (Postfix) with ESMTPS id 45EC5226F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 15:55:26 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id v14so11928612lfo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Dec 2020 07:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=svbcGVl1QfIYwY3SF1xQ7dE/1D48SMB+rHIjpakKBY8=;
 b=JWJDg+WqKClhuVYYuSbQLiIbqtdgNxYKXGz/Kjj+v8QVrMECeb0aIFJhxzMtWqlsDs
 HySkU0RwUUWnAJawk4bQVZ5TDVeelQ0OT58QmPXsA07006CYOHgm517JlOE/qATUUGkk
 8KBr6f1bJyfTtAPK3wRpeLnLxE/do0Rjvvt46xhu1Mle4mtYIkTArFp77qDNURY8T35+
 JNJlxKFDdp4/Sx1a6vrdlETItofwCPdCX5Zwtgx3M/gYzC3QiiQzsqMcfd3q13fTM6lZ
 k2NB6tzoY8708OCkRSap7LzaFZrOqA2ki5ASp+cJP97yTXXoIPUi4oVuRxwa+XI5eJ0F
 doXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=svbcGVl1QfIYwY3SF1xQ7dE/1D48SMB+rHIjpakKBY8=;
 b=nU01TRJydoz5QvGClHbQZtDuHz39wW+XaAk1GXlGJzd+9soL93rUTY8MXV28Ikgj9b
 iSiAyVUtnIZFv/FEM9JyyFVWyZPbsp6B9i+vrCmOK5iyKrd4Vw2a3QF46wGO0qxKmne/
 g9AG/3yL607GzT3ftjhEiAbejxFqJR1mZ7drjoMyvN7pdCapiObchcH/DaqXegZB9D7c
 k9pP6NKj4gOUFY/ZGr41laq8E/ETE7bfVnjHSbpLqFcWu5tPGg1TYDALSJyd0Uvd5SoM
 XNa8BtLtAnhgu/QR+ak6Os21WAGoLsKh1fEKfw6XYpTqvCIumtxc+8xmXxhyGin7fGEr
 xnlQ==
X-Gm-Message-State: AOAM530i/C3kkw9GbNi+zhkGMtC90ZSa9WfRCKBWCwE8gNctUtb6PYjW
 V4QeWGzD+Pe7v4bwmIxmZ2RlQwPT3t4kNCtkLms=
X-Google-Smtp-Source: ABdhPJywqBIULlP7Peh4/yyMYzqJgmHJMnNTPHnup5I2npCnpbX6R7Lu92lnaXTg3ejSP9j3Gsr18GB+Eyt5V3Yoy18=
X-Received: by 2002:ac2:4c39:: with SMTP id u25mr1318987lfq.274.1607183723848; 
 Sat, 05 Dec 2020 07:55:23 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
In-Reply-To: <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 5 Dec 2020 21:24:56 +0530
Message-ID: <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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

Hey Aditya,

> - The check with: "(! -e $git_clang_format_file)" doesn't work
> correctly for me. Although the command runs properly, after I comment
> out this if-section. Probably if we just check for a certain version
> of git which added "git clang-format" for the first time, in users
> system, it might do the trick.
>

True, we need to track that version and terminate the script. Although I
am curious why it didn't work in your case. Is that file non existent on your
system?

> - Also "git branch --show-current" is compatible only with Git 2.22 or
> above (For eg, mine is 2.17.1). Maybe replace it with "git rev-parse
> --abbrev-ref HEAD"?

Yes, that version compatibility might be a problem.
The other option is nice, but again it causes a certain conflict when the
HEAD itself is detached.

In a detached HEAD state, "git rev-parse --abbrev-ref HEAD" just returns
"HEAD".

> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index daafadbb88ca..f7929eb67f37 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -2322,7 +2322,7 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
>         mutex_lock(&dev->dev_lock);
>         setup_opal_dev(dev);
>         ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
> -       mutex_unlock(&dev->dev_lock);
> +mutex_unlock(&dev->dev_lock);
>
>         return ret;
>  }
> --
> 2.17.1
>
>
> Now this patch gets applied to a new "test-xyz" branch, but it is not
> formatted, ie the added line remains un-indented. Is this expected
> behaviour from the script?
>

Currently it should only output the diff. The --clang-format flag is to be used
though. Maybe the diff could be written into a clang-format-fixes.patch file and
apply it later on.
That way the user has more control over what gets changed.

> I have also tried out something similar (using clang-format-diff
> though). I'll try to add it in your script and send.
>

Yep sure enough. The problem was somehow I didn't have it on
my system. So I couldn't use that. But it should be easy to swap
in git-clang-format for clang-format-diff.

But anyways thanks for testing it out!
A lot more to be done but let's see where it goes :)

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
