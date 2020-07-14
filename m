Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CFEC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 06:03:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596FD21D93
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 06:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sv1gc3HN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596FD21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C75F8AA1B;
	Tue, 14 Jul 2020 06:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sz36YcAR5YS; Tue, 14 Jul 2020 06:03:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6353A8AA19;
	Tue, 14 Jul 2020 06:03:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46ED3C0888;
	Tue, 14 Jul 2020 06:03:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 567EAC0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 06:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4E84C8B06D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 06:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6ecg8QiEF-K
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 06:03:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 371728B030
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 06:03:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q5so19844445wru.6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=B9IgmNIfGEZ1AChfxmeB/Nw+sBUhaDDjMTyhj8ylrOI=;
 b=sv1gc3HNcJgQxR0DiqUnSRYDpmpuNbqeVhoMmZj89291CG88XzcOwvn2WbhfbQpILb
 c0d9wBvLhHkb8KmdbRto3AZlKg/kp+x7wNPHP2tTtrxiZJwY1LRMKzLTeWqf76onWqnm
 KymFVFi4BWsDo6dK8o9VtEZmFTgdY/9mEDEjqvAjbt7FgD1kMOzB6gkhQvQA4cPRWolS
 k13+U6o0oAGA4EgCFN5ZUUnDnS9Ezj2uhyK0aFmyvj9dM2l58+M5jhkZOI+hnU3X5Scz
 lX/e5+Ayom3NuaPO9Em2GFxshApABiZIx3euM0m9x5XKLUTw+WnuS0H522pFsWufVwha
 sTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=B9IgmNIfGEZ1AChfxmeB/Nw+sBUhaDDjMTyhj8ylrOI=;
 b=nb15CJM8SjyNg5IjLa94tr1TPge5oqiJA66Yy7D+PG91ATxTB/YJC5F2ZRMLPVwn8D
 lM6nLmbYqy2SYh1ON7STS6NiqoWGHxHIb8mBT45NMC2JJr4m6xN6jXjx+E+LccQrm9ZV
 QJ+nLOFECFyq4wGymPg4g/IWT3H4StHo8nEIBlQcjeOWXqJWLOLEByg0lw6tvINZY9HP
 M0ehyUk4WGu82hKC1jMgIt40z7PJmEanYfcfSidipuw9nC2QKueZdfUPv/yeOzySlpx1
 XyX5UIk1EDn9x3yTkfMPWMlyGpHMEKWZZT22w0Nv4zQeMe/wygTq+FmJ964pJwts5puk
 Wvag==
X-Gm-Message-State: AOAM533EwjnpP1xVASrE7OHmMU/Df2AAlyBluLvtljBwdNupu86DlzgR
 dEl7z9hiFjxj5bez6shoPhc=
X-Google-Smtp-Source: ABdhPJwaQny22fLnF3xQBKKiBNbRo2Vony8zUAwKAy/FiYG12fMowNIPCmDIDw13y/wunSpYPwKCeQ==
X-Received: by 2002:a5d:554d:: with SMTP id g13mr3077321wrw.98.1594706588121; 
 Mon, 13 Jul 2020 23:03:08 -0700 (PDT)
Received: from felia ([2001:16b8:2d88:ea00:c4fb:750d:a5d0:9d75])
 by smtp.gmail.com with ESMTPSA id f12sm26024699wrw.53.2020.07.13.23.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 23:03:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 14 Jul 2020 08:03:06 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <CAD1=X6ktktiJ10f3sefs72_WfWLFEVUg85mvp9391=tsn7gULw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2007140748230.6558@felia>
References: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
 <alpine.DEB.2.21.2007132140160.11844@felia>
 <CAD1=X6ktktiJ10f3sefs72_WfWLFEVUg85mvp9391=tsn7gULw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-514152795-1594706587=:6558"
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-514152795-1594706587=:6558
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 14 Jul 2020, Mrinal Pandey wrote:

> 
> 
> On Tue, Jul 14, 2020 at 1:16 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> 
>       On Mon, 13 Jul 2020, Mrinal Pandey wrote:
> 
>       > In all the scripts, the SPDX license should be on the second line,
>       > the first line being the "sh-bang", but checkpatch issues a warning
>       > "Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
>       > scripts that have SPDX license in the second line.
>       >
>       > However, this warning is not issued when checkpatch is run on a file using
>       > `-f` option. The case for files has been handled gracefully by changing
>       > `$checklicenseline` to `2` but a corresponding check when running checkpatch
>       > on a commit hash is missing.
>       >
>       > I noticed this false positive while running checkpatch on the set of
>       > commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
>       > a script file.
>       >
>       > This check is missing in checkpatch since commit a8da38a9cf0e
>       > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
>       > when the corresponding rule was first commited.
>       >
>       > Fix this by setting `$checklicenseline` to `2` when the diff content that
>       > is being checked originates from a script, thus, informing checkpatch that
>       > the SPDX license should be on the second line.
>       >
>       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
>       > ---
>       >  scripts/checkpatch.pl | 3 +++
>       >  1 file changed, 3 insertions(+)
>       >
>       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>       > index 4c820607540b..bbffd0c4449d 100755
>       > --- a/scripts/checkpatch.pl
>       > +++ b/scripts/checkpatch.pl
>       > @@ -3218,6 +3218,9 @@ sub process {
>       >               next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
>       > 
>       >  # check for using SPDX-License-Identifier on the wrong line number
>       > +             if ($realfile =~ /^scripts/) {
>       > +                    $checklicenseline = 2;
>       > +             }
> 
>       I think this is somehow wrong here. The check for checklicenseline = 2
>       looks very different above.
> 
>       Why does -f work and using a patch file not work?
> 
> 
> Sir,
> 
> I am going to explain my observation based on file `scripts/atomic/gen-atomic-fallback.sh` and
> commit hash `37f8173dd849`.
> 
> If we are checking against the file, `checklicenseline` is set to 1 and when `realline` is 1 the above
> `if` block is triggered, then we check if this line is of the form `#!/` using the regular expression
> `^[ \+]\s*\#\!\s*\/`. If this is the case we set `checklicenseline` to `2` informing checkpatch that it should
> expect license on the second line and this works all fine for a file.
> The `if` block below my proposed changes evaluates to false in this case and thus it emits no false warning.
> 
> However, If we are checking a diff content, the above `if` block is not triggered at all. This is
> because `realline` stores the actual line number of the line we are checking currently out of diff content.
> This value is 2 because SPDX identifier is indeed at the second line in the file but `checklicenseline` is still
> `1`.
> `realline` will never become equal to 1 again and thus the above `if` condition will never be true in this case.
> Even if the above `if` block is triggered it would not update `checklicenseline` to 2 as the regular expression
> is not satisfied since we don't have sh-bang in diff content and just the SPDX tag.
> If we don't do this, the `if` block below evaluates to true when `realline` is 2 and `checklicensline` is `1`
> leading
> to the emission of a false warning.
> 

So, maybe this whole logic needs to be reworked. If you do not know the 
first line, you need to have a different criteria in the first place
to determine if you expect the license tag in the first or the second, 
e.g., the file extension, and then checking line 1 for a shebang is just
sanity checking. If it is of a specific file extension, you know line 1
and it is not a shebang, that is probably worth noting as a different 
recommendation in checkpatch.pl anyway.

Lukas


> So, what I did was to check if the diff content we are checking actually comes from a script, if yes, we can set
> `checklicenseline` to `2` to avoid this confusion.
>

Why would you think that scripts are only in scripts?

How about first listing all files where the SPDX tag is in line 2 in the 
current repository, e.g., v5.8-rc5?

Then, we look at that list and determine a suitable criteria for looking 
in line 2 for the SPDX tag.

Lukas

> Please let me know if this is reasonable.
> 
> Thank you.
>  
> 
>       Lukas
> 
> 
>       >               if ($realline != $checklicenseline &&
>       >                   $rawline =~ /\bSPDX-License-Identifier:/ &&
>       >                   substr($line, @-, @+ - @-) eq "$;" x (@+ - @-)) {
>       > --
>       > 2.25.1
>       >
>       >
> 
> 
> 
--8323329-514152795-1594706587=:6558
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-514152795-1594706587=:6558--
