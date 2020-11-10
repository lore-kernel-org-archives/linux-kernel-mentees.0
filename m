Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D11C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:34:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6580E2076E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLsDj9vn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6580E2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC36E8558D;
	Tue, 10 Nov 2020 15:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9MjYIzLI9UH; Tue, 10 Nov 2020 15:34:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3AF858555A;
	Tue, 10 Nov 2020 15:34:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EFEFC088B;
	Tue, 10 Nov 2020 15:34:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 120C0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0CC5320413
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yirdAm2VYKdk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:34:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 66C3E2291D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:34:29 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n129so14568551iod.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wiDla4qDGAQROJftfCOZ89VciOdQ75BkAsjwUhStgtQ=;
 b=BLsDj9vnR+CRvPCbrMOJSraS8ffauSGr1GJG/iEBfClZ07FuMQGUPnxjFrDKxdFsCG
 SbxR5mmwt/pfeQcNjzDVXr7o7pr44vw0sn44zQjjeQ3QLpNLJ7yrnxqTLn9hoxf6RDky
 odakeMp/l9XDlqQTlR3Wv5SSUAiMFoExot6wQjNCwzb4nUpwiahKPOs6cyAW5eqoWjX8
 fqURQac8QkW1xknpp/rSAFNTBL7p6PBTdK0H3S1NAfAxuC9PLqz47ULgYihyepboXHNF
 bI26/5+R0nInpEN/SaHEU/LXE+sGKAoLT/XigySdlT8A0NRDWt0cdeit4uIaynwOIVve
 dRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wiDla4qDGAQROJftfCOZ89VciOdQ75BkAsjwUhStgtQ=;
 b=GO8NKGV+ZySOoK4Lz42/Hfaf4YRBSkVVtwk03OJYJ5GMlObnPVyScoib8mtPQ35sLr
 gD8FSNa043AkCTOgowMPyE5OJvTeNl/Ypi/cQ6I7oJoX6CnaLTqzSozUEDLWFsd9c1EV
 5+DqBk2tN3aZJi1DDzO+PwdfzYIAriyAbzYIHpJ/KRltaYtNQgNswFdXUi5Swi95TrYY
 cJ/uCZ8tl0Qlsbur+R57MzlHRJPA+kDAIFGNVlE59Nta4OJK+HP9FGvgLVFotqP+4kMe
 wOl+91O8J1/FFl4xQe2vOYql2bwSgFKTQ0CEUCLO8dXH49if/nqgQJp163Ol0WTMZcJw
 G+rw==
X-Gm-Message-State: AOAM5336+ovcMlMtDmTW3qLI2mqMMKftOyzWqPqzCelMFPp++iP2e9WL
 Xcw18k8BKlPXIr+CEMNlk+rZ84HNwbOcPVMcJ94=
X-Google-Smtp-Source: ABdhPJyLs9jDuW6bI+I6fYZl6++cdxR7j3HuHPEmgej4/fTMDOG2D+rfhvsHO5Q7M8Dgt65ZHmLBVeOFLDXOua9MOHI=
X-Received: by 2002:a5d:970e:: with SMTP id h14mr14248048iol.183.1605022468743; 
 Tue, 10 Nov 2020 07:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20201110134214.24082-1-yashsri421@gmail.com>
 <CAKXUXMzSQX-NjOw1KBHMfag1GkizAJvLpyopjiRdOf+6K1r-KA@mail.gmail.com>
 <0ae65118-d18e-5820-e7d4-2dd816251788@gmail.com>
In-Reply-To: <0ae65118-d18e-5820-e7d4-2dd816251788@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 16:34:18 +0100
Message-ID: <CAKXUXMyCJXqxoppfozD0ERtXWZg2Pnzy6dguS5-4c13uN9vRmA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
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

On Tue, Nov 10, 2020 at 4:27 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 10/11/20 8:19 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 10, 2020 at 2:42 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently, we do not have any documentation on commit reverts regarding
> >> the requirement of Signed-off-by tag for it. This may be misleading to
> >> the users.
> >>
> >> On evaluating MISSING_SIGN_OFF over v4.13..v5.8, it was found that
> > Just some minor nitpicking on wording:
> >
> > Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed that
> >> 4 out of 11 cases for this error is because of missing sign offs in
> >
> > 4 out of 11 cases missing a sign-off are revert commits.
> >
> >> revert commits.
> >>
> >> Add documentation regarding the same.
> >>
> >
> > ...to document the community consensus and let readers know.
> >
> > Send the revised patch out to the appropriate developers and mailing
> > lists and please CC me and Joe (because it is also on checkpatch
> > rules).
> >
> Thanks for reviewing. I have updated the message.
> Actually when I ran ./scripts/get_maintainer.pl over this patch I am
> getting a long list of maintainers, so I wanted to confirm once if I
> should send to everyone in this list.
>
> Jonathan Corbet <corbet@lwn.net>
> (maintainer:DOCUMENTATION,commit_signer:9/11=82%)
> Drew DeVault <sir@cmpwn.com>
> (commit_signer:4/11=36%,authored:4/11=36%,added_lines:53/80=66%,removed_lines:212/228=93%)

It could be that Drew was contracted long ago and is not in the
community anymore.

You can drop these five people:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> (commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%,removed_lines:13/228=6%)
> Krzysztof Kozlowski <krzk@kernel.org>
> (commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%)
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:1/11=9%)
> "Alexander A. Klimov" <grandmaster@al2klimov.de> (authored:1/11=9%)
> Tom Rix <trix@redhat.com> (added_lines:5/80=6%)

These are the right mailing lists:

> linux-doc@vger.kernel.org (open list:DOCUMENTATION)
> linux-kernel@vger.kernel.org (open list)
>


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
