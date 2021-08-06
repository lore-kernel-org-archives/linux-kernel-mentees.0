Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9A0C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 20:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A9F60D07
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 20:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6A9F60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC2460AB0;
	Fri,  6 Aug 2021 20:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEzpwM5c28Jp; Fri,  6 Aug 2021 20:06:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 89D2F606E5;
	Fri,  6 Aug 2021 20:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64047C0010;
	Fri,  6 Aug 2021 20:06:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6EA6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE129606F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyORe05F_SA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:06:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45EFF606E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:06:21 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b6so3798657lff.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 13:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9syJGNhYpsqxm0QK1m6upg/HSyyCTQRP7xw+SfZN6s=;
 b=aTclOHhQt8inrAsJp9jDD7BMIhh9YrcMi+2LvETVacNDFwMZHOB3T02RwB/0msH8mJ
 0lV1b8pXtTsDI2Ip3F/UmXwGK+Y24vVL+6ykRJQwsqUayAdNwUi9OURak0E44Lc1cIH0
 yZ5JhHgs+1ShDlvTZrOcGd7Y9AOO+PsLP5CDqYLQrsjWdjuO+KcnLHTMJ7W76S5VcZua
 lPWQ1T6wAkEhIKmVYIhTpgXA7PiZdZMfoTyvzHIN7Zr0AkNuNjUiFc/ZCfwZZkw85FCM
 ZlzvAE1eExz696Vu2MdxFzF8lhoYV0oIA2owzOp0iWgz7e4amv20cBQlnct9SDzHlOwq
 SkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9syJGNhYpsqxm0QK1m6upg/HSyyCTQRP7xw+SfZN6s=;
 b=GNZ+GFT/f1rWz77PvEz9U2r2eF6Czo3oWuKVf1B5dzZ9BXVsXvOzbRmnonNHMbrAkY
 dmjBYtU4JFqnnQSSivsOe05NYWj8jCV7joJJuu83qU7h2JeSFe4FHBG576HWMfk1ezk2
 4JAaoUg4WH27pD+SEIV+Swk+VDG9SpqkcvAWmTiAwXcuH6witQOCv6kbqDEkSfUhPdfm
 Ekitg+7jiLmW05iNZh4RwFgIR88lToe7TMP1T4KkWe/j4Rg4JuNl0IOklavc0TX5VttM
 CWA0zDMuCtiRXaOX6DkBneShA/Y8/mBEreS3SgRvfogLfz/iHqYgZLhwJ+MX1awEtB3f
 3mjg==
X-Gm-Message-State: AOAM533ZGTzPoWsgvklN7KKsaEq6HCyhP1SeB5OftMpyh3s3CLPFPTmV
 s4a42TBVtR3JXuLle/6hE5po24a2f/EdpKKB5BM=
X-Google-Smtp-Source: ABdhPJxMwIJ7hRpinHJUr5so2CrLizjlL4C4xQJ5j3/VwYc3CXyxEk2/vdN8Hdk3BzENTMQl+5iweUE7KqeIku8gXYU=
X-Received: by 2002:ac2:46e4:: with SMTP id q4mr9016170lfo.64.1628280379094;
 Fri, 06 Aug 2021 13:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210806151841.13940-1-vineshraut2017@gmail.com>
In-Reply-To: <20210806151841.13940-1-vineshraut2017@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 7 Aug 2021 01:36:07 +0530
Message-ID: <CABJPP5Byjb+xz3QZMo38bHu02rqwOfwuPjdzsyiHRUpr_zyhDA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: add UNNECESSARY_CASTS
 message.
To: Vinesh Raut <vineshraut2017@gmail.com>
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

On Fri, Aug 6, 2021 at 8:49 PM Vinesh Raut <vineshraut2017@gmail.com> wrote:
>
> Add verbose description for UNNECESSARY_CASTS message type.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea2d8..9cb6b9059fc6 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -268,6 +268,15 @@ Allocation style
>
>      See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
>
> +   **UNNECESSAR_CASTS**
> +   Cast should not be done to any alloc functions.
> +   Appropriate type of pointer is pick by compiler at run time
s/run time/runtime

> +   Cast may hide bugs, as compiler suppress the warning after cast.

The question which arises here is what kind of bug is suppressed.
Maybe follow http://c-faq.com/malloc/mallocnocast.html as checkpatch
says to write up a paragraph on why it is bad.

> +
> +   See:
> +   1] https://lore.kernel.org/lkml/20070808024321.GA6316@redhat.com/
> +   2] https://lore.kernel.org/lkml/a5e60a2b93e10baf84af063f6c8e56402273105d.camel@perches.com/

These links are just patches that introduced the test. There is not much
information about "why" they were introduced.

Other than that change the enumeration type to be
uniform with the rest of the documentation maybe?
The thing followed till now is:

See:
  1. link_1
  2. link_2

Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
