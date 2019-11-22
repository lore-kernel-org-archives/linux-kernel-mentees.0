Return-Path: <SRS0=fwyv=ZO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AA9C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 12:59:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2908C2068E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 12:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DaPJMLk8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2908C2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 084A8873B6;
	Fri, 22 Nov 2019 12:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6r4Gp68ln2l; Fri, 22 Nov 2019 12:59:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E525487252;
	Fri, 22 Nov 2019 12:59:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA526C1DD8;
	Fri, 22 Nov 2019 12:59:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D2E9C18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 12:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 687F688218
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 12:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFKAiFZ3Svgj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 12:59:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E84088166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 12:59:48 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id v24so5440164lfi.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q8dmnxZ8Ub8Bxc2H8I3mPfzbqfpB7OPPdHaZygHcHFE=;
 b=DaPJMLk8AL1aq2ByFGb2IWSuYlXpiez43Oi25BeBN7wROv9RgVJ815FEIM9S8LtBJZ
 UtonKNOJCNB+rDeRCfVWO5NE1S5bLZRNGDZx5UjRfDgZm2YJuJxWT3yNlrS0LoHq2F9k
 VmT47cxRT8H/xf7AvyCN4gT1bdBoBYAV65OH4MLbzwZBnPytv2hJUwu3qpR9fvPqCcFS
 42q0IyZgsuI1qoYCQAr18hOe6tsMEwOYuN6ucIdogf/4horoUpS9E6Gyl91z//4QGT81
 7TaGOV1qU8P3so2gBU0fMgkq3aA5Sjpa17HQ6ejQ77o4kRSxZAXUcPe5NBsEVnvbzrEy
 lyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8dmnxZ8Ub8Bxc2H8I3mPfzbqfpB7OPPdHaZygHcHFE=;
 b=ZNaXxmTwtgG6MGvX1nqRJ1uN5Ov6CBvsqAJ/pda1Mzq7eSbuG3VPzrb0S45cAccadt
 wUOLWItnWt7Uhb3ZbYoNNL+WCM2CcMgKFFaZ7MCEU3h4gUIJ9PGOWd2JSTXE9J9fFYDb
 dTuQICZitUsUXC4JU9eL9i5NOnKZVxGj1AtBNCYLh5GVkcLbe0YLwJRURo6nHM5lNeF7
 JKIriFP/Z5l40M5W5ofNGR/tmLyCrFoDXM9t9MyIke1geRqFRdPT0AotVYgpElv02sku
 En7OFH8L4eq/tGaagsS5lEJP4PdIZM6p0K9+q9VZi+MQ48UxVtBgwuzJfTY3eUKcSfV2
 K6LA==
X-Gm-Message-State: APjAAAV/SKj1jqzE1DfFpfQC5xNO3yypOMAi/q7zdDy7wJp/VlwtigQV
 xtLBkhvqS4SX7DX79Hrq8wW0XQUlqq6fbU6pc7JSKg==
X-Google-Smtp-Source: APXvYqwYz+6QGdIRe/6VX6sUO09vd4ONwLVaGPGso7wwY07jjid5xDn5gxKiF4dN+YxhEi01937w3jc/iLYs/k5FSsM=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr11970188lfn.44.1574427586437; 
 Fri, 22 Nov 2019 04:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20191122034702.58563-1-dwlsalmeida@gmail.com>
In-Reply-To: <20191122034702.58563-1-dwlsalmeida@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Nov 2019 13:59:33 +0100
Message-ID: <CACRpkdbaDEmZ4JCnWGinVVjzbVB=efTjMSTa+mrzuuaK_sCqmw@mail.gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: gpio: driver.rst:
	Fix warnings
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

On Fri, Nov 22, 2019 at 4:55 AM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
> Fix warnings due to incorrect rst markup. Also improved the presentation
> a little without changing the underlying content.
>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Thanks a lot, patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
