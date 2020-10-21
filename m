Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F37C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:14:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B65AD2419B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uqNbSPg2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B65AD2419B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F215E2010F;
	Wed, 21 Oct 2020 22:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdaWNBma6V8q; Wed, 21 Oct 2020 22:14:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8F5C62EA22;
	Wed, 21 Oct 2020 19:27:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 801AAC088B;
	Wed, 21 Oct 2020 19:27:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AFCBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 47244875AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQYaR54CoEWA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:27:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B3578492B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:27:26 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id b138so2752843yba.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5bP6XIkGVul48ky/KDK8Sf+FXg+duJpCHq4dGdE0Uc=;
 b=uqNbSPg2N+D4M2VYaciAM0hkRnUBai1TE0HHRw4tO+V1T6pN0WL+8A+o1HNVVBFG7y
 f69nrXiryg627GNoDJNnsCo7bwLIBFHmWJZkH7Vr+cbjwoZNsBc8ZQGWBFUE+PTsmVhR
 ytFRs5vstUD5vzKl9bGsDYo9FWn432XKW8tjz3LXmep4PgqlFqXB7LvbU8aK/9A0dBuj
 WEvDBqMbRvdgyVlo62RcrFKK/1Kii1kwQ1hCnLYC/yciZS4+pIa8hysvm90mrlbYK1Bc
 eMFfQ3VQAVq2eEBAgD4d8CIoVxSZchh6MCCqP9py589vIhG+qmhB5cK+YAfNC0PhaKHN
 xAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5bP6XIkGVul48ky/KDK8Sf+FXg+duJpCHq4dGdE0Uc=;
 b=YTztK+w0IcckG4EEUIP0KwdMr9uYoqjqahQfu83FAa2fD1sdAJFJBJQYiUFcC6o0KB
 AcxJJvo/cwd+Badt8PjhTyPBFNNxHfizaygFZ9WuUXH9F3dJY0dLYGpVPxVyv5omGwby
 mzUU75nwP5d4/8an8RgIX+iw0UGrESm3vJ1UlzPbE85MnlcVBOaiEqEgsJIImbAQqpKF
 4TYlmH/E63GaOcaUWlQczqvzXcvNND5QRJph/0jM5xGxRgYiq6HfzDO0EE1rPHqerLit
 Tc6FBNGHEDuXZszHBnVBUPHlsHoEVIRHWeVGMh3EQXD57wOodlUT2DBTBMhnUYd21wOt
 xsbA==
X-Gm-Message-State: AOAM532GJm2uX0kQ1UcD5iXLe+dqfAWOeR/fkjZAs6y2N/0vu4ONSjGk
 Tn7mkrTkorO4atHi9D0jTLX+Obbcl835Gd6xBiA=
X-Google-Smtp-Source: ABdhPJwQ6oGRTDWlUSCRHr+DJeqvZ2WuZgEP28Ztn/Hrj9Fa0J0N+ETgyk0HLKGxwill/jIORyeZV9VzqnCqlk4nHQo=
X-Received: by 2002:a25:d441:: with SMTP id m62mr7622555ybf.422.1603308445783; 
 Wed, 21 Oct 2020 12:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200629003127.GB5535@shao2-debian>
 <20200630124628.GV4817@hirez.programming.kicks-ass.net>
 <20200630144905.GX4817@hirez.programming.kicks-ass.net>
 <58ff47cc-dc55-e383-7a5b-37008d145aba@gmail.com>
 <20201021080031.GY2628@hirez.programming.kicks-ass.net>
 <20201021131806.GA2176@tucnak>
 <20201021134436.GJ2628@hirez.programming.kicks-ass.net>
 <CAKwvOd=qi63We=6rLapb565giCVe-8a6d=-=3VZL6RWzhwAeZg@mail.gmail.com>
 <CANiq72m+_QYtn_1gyrjXFs6yeDdiMoS4DVcWqYcTgyCFnSFXbw@mail.gmail.com>
 <3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com>
In-Reply-To: <3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2020 21:27:15 +0200
Message-ID: <CANiq72kfuDfHeL9Eb9e7PccZ+L9wMpnBj_gtFj3-aFfcvYuskA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Jakub Jelinek <jakub@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Aditya <yashsri421@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, dwaipayanray1@gmail.com,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 LKP <lkp@lists.01.org>, linux-toolchains@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] GCC section alignment,
	and GCC-4.9 being a weird one
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

On Wed, Oct 21, 2020 at 8:35 PM Joe Perches <joe@perches.com> wrote:
>
> Perhaps something to add as a generic test in checkpatch.

Agreed! It would be nice to check all of them. Even checking for
`attribute` and `__attribute__` could be potentially reasonable (i.e.
so that people are reminded to consider adding whatever attributes
they need into `compiler_attributes.h`), although perhaps too
annoying/noisy for some (e.g. for `arch/*` devs...).

Cheers,
Miguel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
