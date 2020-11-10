Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C074AC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 16:49:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077E72065E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 16:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZAFk+KK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 077E72065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7298D2033B;
	Tue, 10 Nov 2020 16:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXekxpHrwMvC; Tue, 10 Nov 2020 16:48:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4766E22CB0;
	Tue, 10 Nov 2020 16:48:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E922C0889;
	Tue, 10 Nov 2020 16:48:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97B07C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 93A4A87237
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xawNV8XX-E5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:48:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D0F2787218
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:48:55 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id k1so12769229ilc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUHn2lW1Jib8N1nYOaBnV+VDo07L804NuJiugoT6D0M=;
 b=HZAFk+KKl4+iO8Ha5XpjhGR1+FerAQzlssGi4x2T84nWCwmb3CU4zjnQNKGXHjnr9M
 yzmKCKsDuNY3c31BlkU1TTqadoe2YBfkRRi4WO3OPYcBcuRhAaO/Qna0mI4JGQEeyNc1
 5D/RkD+GckszEbmlPR1TDQAej3M444xjsg7LEvTY5DQofzGafQJzwInTN0hWBwOYYuea
 LkhVNCjAGZWbxuNo1LTHIuSkSkWtlgi5ioJm290lsCumIJTn9hoLyNycuLEUkDkubrUu
 NCrQ34JwZdT5EV2vwEO60wBfYnYGPJouT/L9TmHiQGAHeRkE38ZJjI3c6Vy7lyrzlsYJ
 l0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUHn2lW1Jib8N1nYOaBnV+VDo07L804NuJiugoT6D0M=;
 b=HhLf/KJWJ7IC4BcWKNI/shDDjqS9dmyHtjJnt2wywaI2ggJYdiKY7mqW34XPUjbNkY
 5io33B4e/KBhEm//r1F7v7NV1j9rnq0Uyl60TydZ0XjwnhHIhji4omBGmux7UfZHMixD
 e7R9YCg/IeO7sumruJYDltdMo97mW2qnF475PvIr9ELzl4Bgt+KhwHHn9NvIkUTAWgpX
 yAGKOpePePQQ5YRakISsqmE3M8r3bcM58+w6ajT8K5GHshqe4SgTStm6uoTev/T5/yV4
 HciseRyIN8bNDd7zJnqKU3nai13dSq5lkZ2WghavthdK52src9ENtaRU98ZtB+fTi9gb
 5kqg==
X-Gm-Message-State: AOAM530GLF/2YoHhLzFDeW5gdmFugGLNyiS/P28BQ9n2a3AW0UJBrx+G
 vN1pMnfACoagcx0wbL1ZafNHrRnJ8tEbjF7eOLk=
X-Google-Smtp-Source: ABdhPJx9LDxlXJB760q6Kv2s6XbDvLU5F9LqRG5fCnJagAG/cdZR0EINOHS9LNJJB7MQsmnSkQnuIu1yFgEtUHIRXow=
X-Received: by 2002:a92:512:: with SMTP id q18mr14230496ile.147.1605026935092; 
 Tue, 10 Nov 2020 08:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20201110134214.24082-1-yashsri421@gmail.com>
 <CAKXUXMzSQX-NjOw1KBHMfag1GkizAJvLpyopjiRdOf+6K1r-KA@mail.gmail.com>
 <0ae65118-d18e-5820-e7d4-2dd816251788@gmail.com>
 <CAKXUXMyCJXqxoppfozD0ERtXWZg2Pnzy6dguS5-4c13uN9vRmA@mail.gmail.com>
 <CAKXUXMw2X2V-Fcy7ChMk4gOkDfsiUTVXYFphz3V2uKeF140rdQ@mail.gmail.com>
In-Reply-To: <CAKXUXMw2X2V-Fcy7ChMk4gOkDfsiUTVXYFphz3V2uKeF140rdQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 17:48:45 +0100
Message-ID: <CAKXUXMxbcZFy+HTomU-KgNL2=4xbRSU3aOm8BaUXTMm_T4Sjow@mail.gmail.com>
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

Also I just noticed that the subject line is a mess.

just make it "Documentation: include sign off for reverts"; remove
checkpatch. This patch is not about checkpatch.

I have seen the patch already on linux-doc. You can fix the recipient
list and the subject line and simply send out a PATCH v2.

Sorry for the confusion, I did not review as carefully as I should
have, and I must have been not clear enough on what I wrote.

On Tue, Nov 10, 2020 at 5:45 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 4:34 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Tue, Nov 10, 2020 at 4:27 PM Aditya <yashsri421@gmail.com> wrote:
> > >
> > > On 10/11/20 8:19 pm, Lukas Bulwahn wrote:
> > > > On Tue, Nov 10, 2020 at 2:42 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> > > >>
> > > >> Currently, we do not have any documentation on commit reverts regarding
> > > >> the requirement of Signed-off-by tag for it. This may be misleading to
> > > >> the users.
> > > >>
> > > >> On evaluating MISSING_SIGN_OFF over v4.13..v5.8, it was found that
> > > > Just some minor nitpicking on wording:
> > > >
> > > > Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed that
> > > >> 4 out of 11 cases for this error is because of missing sign offs in
> > > >
> > > > 4 out of 11 cases missing a sign-off are revert commits.
> > > >
> > > >> revert commits.
> > > >>
> > > >> Add documentation regarding the same.
> > > >>
> > > >
> > > > ...to document the community consensus and let readers know.
> > > >
> > > > Send the revised patch out to the appropriate developers and mailing
> > > > lists and please CC me and Joe (because it is also on checkpatch
> > > > rules).
> > > >
> > > Thanks for reviewing. I have updated the message.
> > > Actually when I ran ./scripts/get_maintainer.pl over this patch I am
> > > getting a long list of maintainers, so I wanted to confirm once if I
> > > should send to everyone in this list.
> > >
>
> Maybe you misunderstand my previous email:
>
> you should send it to those two people:
>
> > > Jonathan Corbet <corbet@lwn.net>
> > > (maintainer:DOCUMENTATION,commit_signer:9/11=82%)
> > > Drew DeVault <sir@cmpwn.com>
> > > (commit_signer:4/11=36%,authored:4/11=36%,added_lines:53/80=66%,removed_lines:212/228=93%)
> >
>
>
> > It could be that Drew was contracted long ago and is not in the
> > community anymore.
> >
> > You can drop these five people:
> >
>
> And "drop from the list" means: You should not send it to those five
> people below.
>
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > (commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%,removed_lines:13/228=6%)
> > > Krzysztof Kozlowski <krzk@kernel.org>
> > > (commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%)
> > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:1/11=9%)
> > > "Alexander A. Klimov" <grandmaster@al2klimov.de> (authored:1/11=9%)
> > > Tom Rix <trix@redhat.com> (added_lines:5/80=6%)
> >
> > These are the right mailing lists:
> >
> > > linux-doc@vger.kernel.org (open list:DOCUMENTATION)
> > > linux-kernel@vger.kernel.org (open list)
> > >
> >
> >
> > Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
