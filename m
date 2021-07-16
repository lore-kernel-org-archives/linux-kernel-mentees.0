Return-Path: <SRS0=Sa9D=MI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0438C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 20:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564EC613D4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 20:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564EC613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D56403EB;
	Fri, 16 Jul 2021 20:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Zkc3y2Xrr0o; Fri, 16 Jul 2021 20:33:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F3133403CA;
	Fri, 16 Jul 2021 20:33:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6DCCC001A;
	Fri, 16 Jul 2021 20:33:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7AE2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 20:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5D63403CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 20:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hTbVKKyLRmf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 20:33:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D23ED403AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 20:33:55 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id r132so16873737yba.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CASdABC4YogowTi4wgMPvYayjJdW7krty8HdtM50CCs=;
 b=R4X5j0HvU8dVfIV3qClRsAinnTeQSOmjY7eqGRXEsqWljgUsUIIfPiT8I6eaPfgBvb
 15VxFWIFOPs/TIJcQSNq3FlGYHHq2VjU0/xhd+N8iXb32naXxdMN+vBjgbkJYlijyqPr
 FBa3K+C7i1Crq/0/aHDj+OgWSTaOVwq6E87TQSztR4maHP9DSQwEVZdO5iVDqrfDTkM7
 KCY3gNLcpaDyiZdN/rHhw3HawY7QTiQCQR9D8iGAjYt1crf9Ryt5jiemRWqXBp38h6ku
 AsMep7tkqI6XouAlPknb8IyMzeSC0vgCGfbvD67zkvi8DyvwAj2dWb/Hh+poWW7Fh0R9
 y6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CASdABC4YogowTi4wgMPvYayjJdW7krty8HdtM50CCs=;
 b=PZLX848a9YKB4EfFRYd2Le0fidB99UZTo4Ou9XbToSMvvrp2j3dSrdfbY3AxU0tPQR
 muuIThuztdKpWRqdFE1fS6fM3wiFCSdgyWaTuW7PMntKhOWwDfGKXi9sYme83/cNplmT
 XoXz9A/GT8IveMtd9S/OAjCksH26MKmJIo1MNv+p4+qxJNxLGXxaZYrO8C+uN7fmMsRw
 B525LWl2MTEFnkKdxpbzq2r8gLiMYS0tchbQ45bSCPtdQiQ0wPW0oqA2AA1OKPFm1qfO
 R0GocE5Om3u/GRhL7D+5adjv7lqRKqY5LFFGxX1c/qqop/q1eltvayDR80MBz4Hc6aW+
 mDfA==
X-Gm-Message-State: AOAM533EBOI6blM9ngUvnmAhMHlN4RLgPZqWP/C0xoia3PFWYKafz1pT
 E/vT91eBJYpfE0ThZNrdczWXzVGhHF/xBfgPrNQ=
X-Google-Smtp-Source: ABdhPJw0ZZ4DLEF5BKM+bwc+OmDUNvjRB32iE4bbR+L+LWfkf8t/+7R4OLhdnBnZHj367H7tQbnIgmT7sOdyl6VaElc=
X-Received: by 2002:a25:f0b:: with SMTP id 11mr15196031ybp.518.1626467634722; 
 Fri, 16 Jul 2021 13:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn3W_kg-Xk9z0qFJVVuUxzyPGevOe1w7nnammn3LvXFQq3g7Q@mail.gmail.com>
In-Reply-To: <CAFn3W_kg-Xk9z0qFJVVuUxzyPGevOe1w7nnammn3LvXFQq3g7Q@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 16 Jul 2021 22:33:43 +0200
Message-ID: <CAKXUXMxz2FNo9DV5Yf5ReczVUfYLcrkzLrOMTM4eZq1scWJa2w@mail.gmail.com>
Subject: Re: Mining Maintainers Mentorship program - Mentee Selection tasks
To: Abhinav Dubey <abhinavbhardwaj510@gmail.com>
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

On Fri, Jul 16, 2021 at 9:22 PM Abhinav Dubey
<abhinavbhardwaj510@gmail.com> wrote:
>
> I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.
>

Thanks for your interest.

For the mentee selection, please work on the following exercise:

First, download the kernel git repository and compile the kernel with
the x86-defconfig build configuration.

There is a file called MAINTAINERS in the root directory of the git
repository. Read the introduction at the beginning of the MAINTAINERS
file and understand the content in the file and its organisation.

Explain in your words: What is stored in the MAINTAINERS file?

Now, search for specific MAINTAINER entries; Please answer: Who are
the maintainers and reviewers of the following sections?

ACPI FAN DRIVER
AF9013 MEDIA DRIVER
BROADCOM BNXT_EN 50 GIGABIT ETHERNET DRIVER
DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
INTEL KEEM BAY DRM DRIVER
LICENSES and SPDX stuff
M68K ON APPLE MACINTOSH
MEMBARRIER SUPPORT
MICROBLAZE ARCHITECTURE
RESET CONTROLLER FRAMEWORK

Please let me know about your answers and always send your responses
to the linux-kernel-mentees mailing list.

After that first exercise, exercises 2 and 3 will follow.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
