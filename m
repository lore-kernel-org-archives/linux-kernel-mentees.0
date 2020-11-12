Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1110C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 16:19:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEDB7206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 16:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mm7nfHsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEDB7206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A50A871A9;
	Thu, 12 Nov 2020 16:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjKA1bRZSFkQ; Thu, 12 Nov 2020 16:19:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF8A887159;
	Thu, 12 Nov 2020 16:19:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2B7DC0889;
	Thu, 12 Nov 2020 16:19:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E72EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 25BA18711A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIqOzXUMG4W4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59D6587175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:19:44 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f11so9281885lfs.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cel9k7ZRpAFiqLoWlp05NzpjKsZPuIKwk23dlhqr73A=;
 b=mm7nfHsTe5EEsfqyacNANJOnnWjbzf98DivWpySe7zzf219NBfYnknr8U0sxwwWW1r
 J0LBlGeRCuzCT9od8fZ6FFiHJYdIMCC9rtdBZxGofunGvCbi+DN3ohTfZxzOY6DKBDLj
 lC5M2h4aAQ1N6YB08NpI7F3NpPmYgpMNDgsu/CVSd5IxZsbZH/qibZBBY462SlWHBshN
 VCBqoCD3653XpG9sHQ+XEeSMvKSbY0ozWlHhFfWWUT1FxlJV4C6Vkc53fzu1pXwH+gMj
 aXHuL6zhI7jqjj51slou24giScFcKB5+6B06FMxGsGqLxeiKPpJEDM4BbYI69e+vO3qf
 tQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cel9k7ZRpAFiqLoWlp05NzpjKsZPuIKwk23dlhqr73A=;
 b=iryAW6X65nEwsCJd0Ous8fbYh490ytVPYyrwbKbh/eO8VGfujvk+rTkfBIt1AWRXT7
 smOX9D+G7+bNL2akv40mnAnoHUV/zmyiumESN5VamJN8epC0tpdUwLlpC7jKCoocL5ar
 W6Ts476Zjm8ePUgVXECVvPcJ2GrsorN77va2D+Q8VH/qVcM7qwUFU8vjUC9ErGsC2Bwa
 /yaIFdrwMzp+vGXUSd8J2S7Y0InNkAbAQ7CqC2/piDZ9Vri3SmFidsnyBXxzWzsEPAwQ
 4y6XtF0INCNESuC/AWFR4KUaWda8zdeHU/qdgYmQ7qj0S/Mvsa702wWIipyg+ZhV0+o8
 Kf6Q==
X-Gm-Message-State: AOAM531uHVWk5ClCI6utN4513i688q+l2Qj1jnY7j09Vu4uAT39CBS6Y
 irn3ieH0XLfon1nHV8iw2qogoRXYN9PmGYCTODU=
X-Google-Smtp-Source: ABdhPJzO3ph7WRPr9m7GqUL/FMuzy2XL8n0c/H0BJmedH3VxHSVyiCd+PSaJ9Ol57UqnzelVZS95nxBBapxbrsqFj/w=
X-Received: by 2002:a19:5c8:: with SMTP id 191mr3585lff.111.1605197982048;
 Thu, 12 Nov 2020 08:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20201112154330.35750-1-dwaipayanray1@gmail.com>
 <CAKXUXMzaf4erZ8Bxe6QbNpRbjXuU61+QE5OS6jkX_Wi5qLJUzw@mail.gmail.com>
 <CABJPP5C5poyCQQWV-oq-KVDuJQ=o-K0gLuSW=qSk1scbpvMycw@mail.gmail.com>
 <CAKXUXMyHrWuvg7Kppfg0y8Wgg69DMSF26xZMip7Zhght4U6Xnw@mail.gmail.com>
In-Reply-To: <CAKXUXMyHrWuvg7Kppfg0y8Wgg69DMSF26xZMip7Zhght4U6Xnw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 12 Nov 2020 21:49:11 +0530
Message-ID: <CABJPP5CHohiep0mZhcW-e=03GYeCwmjg6UM9gKxtFkw=xdL0CQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new cases to
	commit handling
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

> > Yes, I had a previous warning dump for 50k commits
> > from v5.4.
> >
> > Earlier, no. of GIT_COMMIT ID errors was: 1032.
> > After the patch it is: 897.
> >
> Impact-wise that sounds like a good contribution to checkpatch.
>
> > I haven't checked which ones exactly were fixed though.
> > I think I could extract those commit references just to be
> > sure.
> >
>
> Let us create a quick list of those; it will probably just take a few
> minutes to check them. And Joe is probably going to ask for an
> independent check anyway :)
>
> Add the summary of the evaluation to the commit message and then let
> us send this patch to Joe and lkml.
>
> Lukas

Sure okay, I will prepare the list and send it off :)

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
