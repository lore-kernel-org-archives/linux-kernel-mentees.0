Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C57C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 14:49:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7632206B2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 14:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhNfslzH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7632206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F35480585;
	Tue, 10 Nov 2020 14:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45WUYaKx++lf; Tue, 10 Nov 2020 14:49:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4110E840C2;
	Tue, 10 Nov 2020 14:49:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3078EC0889;
	Tue, 10 Nov 2020 14:49:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA0B2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A299F20488
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZ2yasIEQIYp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:49:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C1A82042B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 14:49:26 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id x7so12299357ili.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 06:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VNvbpZ00cNW4lHu5DJb6gTqFqswVVQZ1oD/XuwlnIBE=;
 b=XhNfslzHXBFdCk3MEuYrppm7ijVG2VUQLBxxqvh39gwdeEKZ4Z1Pn9JhgbJNiZlH5i
 LS4Cavz/ejxkWzon5VbBwORAlmonMKn+EKjYARxNwtgM6GClf2ewQputqw9qGoaQBVw6
 fVtEiYaeqUDTBz1yrtCzyWWZrjpIn3EJhIQCWBfkXthDJyl4Z+zeTg6VU2AP54iCLz0U
 MP0NddMqwTo1+Rr5DgjUTZbH66siJZdknG6FcPde/uXaLNsZIqax52bTb3c0SFw4BtFU
 V/qr0hayye/c6WFyEWcPoa39LNjvMEdD7esSiuaBPyQsYTrGyvQDWnnnduQKc9NHXwsA
 bo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VNvbpZ00cNW4lHu5DJb6gTqFqswVVQZ1oD/XuwlnIBE=;
 b=Gv1m6x9TKzqlhc0JpciKwW3AMJNKw7NrMbI1gafzPj0io+tlnuS5HNYPUQw3b9zY7g
 +nz5dwiPFZ3cyCeh857GOw7sIoDmAfYZtWU3BPTwIu/imQLuv+xmYwPUhhxy8lIQ63Vy
 7WU1hg7tiAVbDwueCAAoFwvrm68FWmVMCGbPOmmOe8c56FieihzbhgEa/iN2ug5gbhYP
 yjVItlQKOHz47PxDQkUnnzrTmJastyj9uUZ1UnZhZjjlpJa98gKkOoCZSJQ8oWZEnJd3
 LT3X/z5VL0wfZwofPwaDdfa9eKs4DXOH1Fc45GvAMPy8Hb1l7gqKOr6JDmkOA/Nyhsay
 AWZg==
X-Gm-Message-State: AOAM533Hjr1xjA0E4seIBdL5ALj61lD866F3iiPbiFvjwsYwVCwpxev9
 v0edvTk5GScGRgwGjhaebkoOS31+0rVU/Vei/wk=
X-Google-Smtp-Source: ABdhPJyWfYVWKzE8w1v+aDyRuR181FF7SmBEt7hAYI99K8viE0fKt9daa/QJK1TLPe4cEITw2vKoTWgI1Ytds9A0AbA=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr13866371ilq.64.1605019765635; 
 Tue, 10 Nov 2020 06:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20201110134214.24082-1-yashsri421@gmail.com>
In-Reply-To: <20201110134214.24082-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 15:49:15 +0100
Message-ID: <CAKXUXMzSQX-NjOw1KBHMfag1GkizAJvLpyopjiRdOf+6K1r-KA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Documentation:
	include sign off for reverts
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

On Tue, Nov 10, 2020 at 2:42 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, we do not have any documentation on commit reverts regarding
> the requirement of Signed-off-by tag for it. This may be misleading to
> the users.
>
> On evaluating MISSING_SIGN_OFF over v4.13..v5.8, it was found that
Just some minor nitpicking on wording:

Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed that
> 4 out of 11 cases for this error is because of missing sign offs in

4 out of 11 cases missing a sign-off are revert commits.

> revert commits.
>
> Add documentation regarding the same.
>

...to document the community consensus and let readers know.

Send the revised patch out to the appropriate developers and mailing
lists and please CC me and Joe (because it is also on checkpatch
rules).

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 83d9a82055a7..ff065e1f6a25 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -404,6 +404,8 @@ then you just add a line saying::
>
>  using your real name (sorry, no pseudonyms or anonymous contributions.)
>  This will be done for you automatically if you use ``git commit -s``.
> +Also reverts should include a Signed-off-by. ``git revert -s`` does
> +that for you.
>
>  Some people also put extra tags at the end.  They'll just be ignored for
>  now, but you can do this to mark internal company procedures or just
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
