Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D035C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 11:49:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 051DB23741
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 11:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 051DB23741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 91C948685C;
	Thu, 14 Jan 2021 11:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUxqwxNNjr9l; Thu, 14 Jan 2021 11:49:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79031866DA;
	Thu, 14 Jan 2021 11:49:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 641A1C088B;
	Thu, 14 Jan 2021 11:49:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF8AAC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6408868EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEuDDN_axmes
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:49:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C27E0868E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 11:49:23 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id q2so8857145iow.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 03:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4RgehOiYuLwTJG4mx4zEuvbGGm2iliS/pscxK+Ohf1c=;
 b=nmoccuIjk1QE+JBydiUdujUtfB4NcOz2O/czE29ZNc1ECsw0NFR5Byph4wEBpd6W4H
 59+IzLzTxDS4/k+l9OS52zP1xL7/8yWJAXrK8x5tXSJ1Pjqqc5mhpK/HJs8aWzAYg9/Z
 6ApEFmp/1ABH6THpb9QU5ShwEtzTBr/QBXloUIXx77jSPoQ0QdCaEBbM9/SiT72GJvYx
 B489d/iR5bmANQNv8qehwUc/fi3Ag0JPJZlX3o69BXhHAL+YaUaUR9V6ThVW00rjqP6O
 Cd7r8Vd0chW7NFZkuYoIvtXmDmm5dRKhFBas5mJKBR8EkmaWVkWy1i0RK3d8qGLxAzcV
 +8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4RgehOiYuLwTJG4mx4zEuvbGGm2iliS/pscxK+Ohf1c=;
 b=Wa56N7BTm+XXkphcI/ks9bbBDfjAUMdfBMRJtlGDRqAYhoF2zff0UtTA5JS+Zx1ZC8
 5DZrRXtnNtm+qJ7fV0yXtPtqaTYBhRc/Rq6Xa6CpJkpZXrS1B9IDQ1Mjpce8XoN5EJOX
 vLZmqGIeLB84nuvijVs1EtPIDhjyhiwmM+vO6WvH1r/vmsJA5lTq8X7EEMYiWhB11qbE
 RzX5KMF3EYHm+QTfSIGNImOdyliJgEuANbgJu1Pj1IS2SMqWxspj8HffointSZTwiwDT
 XlVvDC9aEQo62RC7OADb92Mq10uDQ5yj3WigaU5X3nwK7onAsg7GxJg9ymCd7wgOYnfe
 cP/w==
X-Gm-Message-State: AOAM531a2wmQq/g46UXmKL7BTylmqiOQw1Jh6nqlAebQUHNP8GKZitLK
 USuarDgSfCxqWvVet0ChUXPqQTARPjDy35U5a1I=
X-Google-Smtp-Source: ABdhPJz9K1iiR0Fhwtasx2BLebuPTy24A4jJxisxQ9VGDqlW6xD9PwM2d72QpLEUHqzCKDCO6/AD5ZinLIcmzsVeLeY=
X-Received: by 2002:a6b:8b84:: with SMTP id n126mr4020253iod.189.1610624963095; 
 Thu, 14 Jan 2021 03:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20210112115421.GB13086@zn.tnic>
 <20210112194625.4181814-1-ndesaulniers@google.com>
 <20210112210154.GI4646@sirena.org.uk>
In-Reply-To: <20210112210154.GI4646@sirena.org.uk>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 14 Jan 2021 12:49:20 +0100
Message-ID: <CAKXUXMwoY+__Xrg3uKtz3AzgDorVTKtgtQnisoSWO8Wh0tmDNQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000cac82a05b8dad8b3"
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Fwd: [PATCH v4] x86/entry: emit a symbol for
	register restoring thunk
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--000000000000cac82a05b8dad8b3
Content-Type: text/plain; charset="UTF-8"

Dwaipayan and Aditya, here is another candidate for a checkpatch rule.

Lukas

---------- Forwarded message ---------
From: Mark Brown <broonie@kernel.org>
Date: Tue, Jan 12, 2021 at 10:02 PM
Subject: Re: [PATCH v4] x86/entry: emit a symbol for register restoring thunk
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
<bp@alien8.de>, Fangrui Song <maskray@google.com>, Arnd Bergmann
<arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Jonathan Corbet
<corbet@lwn.net>, <x86@kernel.org>, H. Peter Anvin <hpa@zytor.com>,
Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda
<ojeda@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Joe Perches
<joe@perches.com>, <linux-doc@vger.kernel.org>,
<linux-kernel@vger.kernel.org>, <clang-built-linux@googlegroups.com>


On Tue, Jan 12, 2021 at 11:46:24AM -0800, Nick Desaulniers wrote:

This:

> when building with LLVM_IAS=1 (Clang's integrated assembler). Josh
> notes:

>   So basically, you can use an .L symbol *inside* a function or a code
>   segment, you just can't use the .L symbol to contain the code using a
>   SYM_*_START/END annotation pair.

is a stronger statement than this:

> +  Developers should avoid using local symbol names that are prefixed with
> +  ``.L``, as this has special meaning for the assembler; a symbol entry will
> +  not be emitted into the symbol table. This can prevent ``objtool`` from
> +  generating correct unwind info. Symbols with STB_LOCAL binding may still be
> +  used, and ``.L`` prefixed local symbol names are still generally useable
> +  within a function, but ``.L`` prefixed local symbol names should not be used
> +  to denote the beginning or end of code regions via
> +  ``SYM_CODE_START_LOCAL``/``SYM_CODE_END``.

and seems more what I'd expect - SYM_FUNC* is also affected for example.
Even though other usages are probably not very likely it seems better to
keep the stronger statement in case someone comes up with one, and to
stop anyone spending time wondering why only SYM_CODE_START_LOCAL is
affected.

This also looks like a good candiate for a checkpatch rule, but that can
be done separately of course.

--
You received this message because you are subscribed to the Google
Groups "Clang Built Linux" group.
To unsubscribe from this group and stop receiving emails from it, send
an email to clang-built-linux+unsubscribe@googlegroups.com.
To view this discussion on the web visit
https://groups.google.com/d/msgid/clang-built-linux/20210112210154.GI4646%40sirena.org.uk.

--000000000000cac82a05b8dad8b3
Content-Type: text/plain; charset="US-ASCII"; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
Content-ID: <17700b9a59561a8e03b1>
X-Attachment-Id: 17700b9a59561a8e03b1

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBQUJDZ0FkRmlFRXJlWm9xbWRY
R0xXZjRwL3FKTmFMY2wxVWg5QUZBbC8rRGtFQUNna1FKTmFMY2wxVQ0KaDlDcTd3Zi9UMjVGWGlR
UVoxdnFRdXZ1U3M5eTdVaWRJVGpObjAwb3IyQW4vOUFadmpkN2ZOU0lHaXRFNkpaRg0KdWxMYTNE
bm02RG5KOElIeENvbS9mOUhBMEJocWR1b3R0dW4wMGdQcFJFNHlZbmM2STZyczQrakQzRDN5YU0r
ZQ0KUDQ4S1l5MnphTkY2WGd1ZDN3ZE1kQldyTzZ3SGJway9GdHJHdTlteXhLWGJQb2FXWENjLzJK
TytsUUdIeTJMZA0Kc3RSb1BMenVOSEdzcWlpUXlRVkZVQ0pjdmE2eTJxNVVUWXFXRzIxbG9GaXJR
MGtoRUkxYUh3VnVpZmVkZHBqRQ0KSmFtaFJxUWhtbFREOHFScm5mOGM0aVZqNm9leFFzS3pqT0tr
YUtYMnFweVloSzhieGRndkc4cjBrd0pmbnVaTQ0KTE9iZW90TXN5blI4Nk1GMksvZlZGVHc3cjRm
WE13PT0NCj1IOWRTDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==
--000000000000cac82a05b8dad8b3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--000000000000cac82a05b8dad8b3--
