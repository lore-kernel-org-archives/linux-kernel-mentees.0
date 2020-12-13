Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4D2C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 19:47:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B4D239FC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 19:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B4D239FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B93D086B28;
	Sun, 13 Dec 2020 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUWXAnLohMfr; Sun, 13 Dec 2020 19:47:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 371BE86B14;
	Sun, 13 Dec 2020 19:47:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FA46C0893;
	Sun, 13 Dec 2020 19:47:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF36AC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 19:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9E1E887175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 19:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxvb+cofIR8I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 19:46:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D1B1F87174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 19:46:57 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id w139so13518145ybe.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 11:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1lkJR6Tf0DSnFojsG7MMX8zHLQgDTQjXzhBTEJ/2jw=;
 b=PG7d8+k0vVH/CZnexGwEEFsg8otWhpWCqHVRmhwgJLNIp1T8mhMgEzeSStTtnbXq4Z
 SJBHXkfB2VA/8WHiN5bMuGY8/Jwnkqgnq3minO/aG+sfx3KY1K8dL//FE5UiNcmObpAB
 NIAtJlTu1Ai0gJuCLbiO6ottS7Ak+cYWQms/+qOqvWRY40qRuC+66sEMFI3tW3dpaXRd
 544K2rKZVYywsThZYPkY1EvFawo7ljVDBR6eF40WC/hmath2DSunXP9jRMD3ZsxEE928
 DgXtpH9a7k6k3IbT7SYJSR0UIFJ1rrenEmv/bnuTBg0QY/y3Uv+Dt8SNmpeJWyinvOv2
 HrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1lkJR6Tf0DSnFojsG7MMX8zHLQgDTQjXzhBTEJ/2jw=;
 b=iXWl+FWNa0B43SLT0c0BvAWZhJ9d9r0HHeaZBRuAuxBgkGBoCTRw0RICtohZHb/DVR
 mgfnYDVutDFI4QkKrCyhxXcjYqM6IQBs6HXA2s3nN/u7glIEx0q8RUBxTI7WsxSmABN8
 CJGXm2CTgIhdoK5B13ooKFSulUz5tUyYG8+ITZXlhYZQfIIF956LqH1pRYSORds02ATW
 lwxjl7QdvrYqUDWWoUK0JbFfZMEP/LTaRKzjNxDEJHvDXaZAR4l2VC9KN1ZUr5t1DaUw
 03K9zXbPvttbLD2WOrC22Qh2dCLxYdHI4UJwXMbyezyy/MIkOu1hD6QkB8CjgIJZoBGZ
 Q1ZQ==
X-Gm-Message-State: AOAM531nvUua3EqMRE0S1mxUQGpFw9hqeBMiRBNb0+GpDQBlqAx8+fPl
 9aTDSHEJGRhKGkTlUfvADujK1jLmXd6sG+sgGIk=
X-Google-Smtp-Source: ABdhPJxhpX6GnebHkY3TuhpxGk7g9frp5gRKb3YlxLsRdnIolUVmruMsUd3PNtzc+vvVWRINN1Ad1krS5cke2/HYjEI=
X-Received: by 2002:a25:50a:: with SMTP id 10mr8558198ybf.115.1607888816911;
 Sun, 13 Dec 2020 11:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
 <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
 <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
 <3ce8fa0c0d7a2c38b532bd4944f4158cfa0db072.camel@perches.com>
In-Reply-To: <3ce8fa0c0d7a2c38b532bd4944f4158cfa0db072.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Dec 2020 20:46:46 +0100
Message-ID: <CANiq72kOE3Y0Jji=igG_vqu0MoZyGeJJSfNWwj3ZA4oSikG9eQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-leds@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] leds: Use DEVICE_ATTR_{RW, RO,
	WO} macros
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

On Sun, Dec 13, 2020 at 7:21 PM Joe Perches <joe@perches.com> wrote:
>
> clang-format is not a tool to rewrite code only neaten its layout.
>
> coccinelle _might_ be able to do this for limited cases where the
> show function is in the same compilation unit/file, but even then
> it would not be a trivial script.

+1 The most robust approach, but the one that is most involved, would
be a clang-tidy check.

Cheers,
Miguel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
