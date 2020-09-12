Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45112C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:21:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCF0208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKQ9vo0N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCF0208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5013987052;
	Sat, 12 Sep 2020 12:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMvOOgQ5HxWD; Sat, 12 Sep 2020 12:21:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A6A386DE6;
	Sat, 12 Sep 2020 12:21:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 847A6C0859;
	Sat, 12 Sep 2020 12:21:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76C61C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5E89B86E07
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIcxEiE1oxA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:21:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 78A1286DE6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:21:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e22so2547718edq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=micP2wrcZDyw/sIW+NwjPm4G3qbIXSgdiymYaZt/zl0=;
 b=dKQ9vo0NZ+Q09pYcloe0trqf1eOeXYTo7qBWJU+2r4PtdJKMkc3+jHG/aFSct9uuHP
 BiUeCDQgZ6TQL1JPx/UzhI3KY4QxkT2cNPfC283xjynj67R4uhn4Ko5FLNX8c6fZI3VR
 NTR717ofToWpWLJt+5jmFfRdM7b7II/3Ks3p+3DSjGnUmjxGKfFGTG4tu69pk89Cg2yu
 uOJ+Rmbg7A/yYmtCSoDYzlULxKCYNepovkhcZrVxS1vt9qHLOQHoeg4uMuI/d8fk+c/+
 2EF00iUi45hXrOnjAv1Il/KGZppGX7jnBzZyME90Pk55mpJhni4/3uL/8Fvb8ZUuKMjN
 XzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=micP2wrcZDyw/sIW+NwjPm4G3qbIXSgdiymYaZt/zl0=;
 b=MK2byC86GmzDgXIG2sIYMcX03myLHEo+wWayo7dzRBTuvAh13UnNKDqRKPrHwrA0X0
 Pc0vmqjnkEBtpkYIzYIXBoTFJTXe81y6NmrK8KgxsJVvIojATJq7iEV3CBxQoW5Z3CCt
 vAdnPlsNQMpHj9FRjPRlJiyS7PgNpe3w83TpVm+cq8jyZDwcLp0rVi04jJLK4ue2G7OO
 JLYC7KCobNkSmqfYWIUFeioMK9UfVkya+7SpQ7QtbGSTluFxKBpjF7rSx3k9DJmEd1DM
 qfXIWkXy2Lnq1NRtVRRpRlrHeCOcjP06qhnS++b1fMFIUUYJ+JoiMlybIlWXDbrGuZp8
 aCgQ==
X-Gm-Message-State: AOAM531S8+lgDo+nYY/oO11Ax2q0pkagNh4peZ2x1VdOon0n4O1wsTWK
 PTTX6wdue1V3Mh+tQ/WdFlI=
X-Google-Smtp-Source: ABdhPJySB4Uv1Xi19CpcjKbkQCcNbxKyVVBWmAiC/fC6/GdCr/70lY15u2j/uocidzOKRS+/SWRODw==
X-Received: by 2002:a05:6402:1110:: with SMTP id
 u16mr7984594edv.253.1599913306962; 
 Sat, 12 Sep 2020 05:21:46 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id s15sm3055667eju.105.2020.09.12.05.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 05:21:46 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 14:21:45 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009121419430.3770@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-539835791-1599913306=:3770"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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

--8323329-539835791-1599913306=:3770
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 12 Sep 2020, Dwaipayan Ray wrote:

> 
> > Hmm, your email client still seems to be broken :( If you answer to my
> > email, it should use ">" not tabs. Maybe you can fix that.>
> > I looked at your scripts, I did not run them. They look as if they would
> > do the job you claim they do. They are more complicated than needed, but
> > it was not the task to find a simple solution. So, let us try them.
> >
> > Please have a look at this patch:
> >
> > https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
> >
> > The author states:
> >
> > This issue was discovered through a thorough analysis of checkpatch.pl
> > errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
> > v5.8.
> >
> > Before applying this patch, checkpatch.pl reported 342 errors of type
> > GIT_COMMIT_ID. After applying patch, errors reduced to 284.
> >
> >
> > If your scripts work, you should be able to confirm the statement.
> >
> > The tasks are:
> >
> > 1. Run your scripts and create a full statistics of all error types with
> > their according count for v5.7..v5.8.
> >
> > 2. Apply the patch with git am.
> >
> > 3. Run your scripts again and create a new statistics.
> >
> > 4. Compare before and after
> >
> > 5. Make all results available on your github repository.
> >
> 
> Hi,
> I think I got my email client working now.
> 

Looks better.

> The last time checkpatch.pl took awfully long to run on so many commits. :( 
> So, it might take a while but I will report my findings on this as soon 
> it is done processing.
>

I guess a bit computing power is required, SSDs, parallelization and 
multi-core systems help :)

Lukas
--8323329-539835791-1599913306=:3770
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-539835791-1599913306=:3770--
