Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAF1C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 18:32:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 802B020731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 18:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpUJGi7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 802B020731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DB35866FB;
	Mon, 14 Sep 2020 18:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VmCplRGWNXO; Mon, 14 Sep 2020 18:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71FA3866F0;
	Mon, 14 Sep 2020 18:32:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54D25C0859;
	Mon, 14 Sep 2020 18:32:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B273C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3D63720532
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdDaBq8CHKsW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by silver.osuosl.org (Postfix) with ESMTPS id EA8D92001E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:32:13 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id r7so1317232ejs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0asq3qzYkcTW0T3POqtYhWYdwBv26MypwWtgPf1/jWk=;
 b=GpUJGi7KsaPc7pFwXN4WKUFrh/tGFbhC6vuEkZjxwk4PZ5DZrxlsDgDHHRV7wNjN6T
 dVrq4mnyFR7QcxTE1hJZ0sBHkR2wvCCkvkpnL35Ow1AbOxJtWECvI8ODlVtJ4j9F6RQY
 rsctaLAZZOgdux2ewA/ANTUE/lh9QWXs8OpMXEOaYFWtg6ZJ6YLCgawB0zFTLORcGm5A
 6uGqw+loXoUDhpkot8up0xRnb7P+HPCaVVqvSW2ZPWZYAajVbF3iGPtC4ELtcL0IEOlV
 5BJA4DlRDDO3cZwqInc+pLqUFSnK7XXp9pVS4GRxTBM5cDw9ZxBIfF3eXlEDfpdhmUeH
 Y0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0asq3qzYkcTW0T3POqtYhWYdwBv26MypwWtgPf1/jWk=;
 b=rvC2tRyYI4h40L2FY6iQl7B0guEDXNPQ43EzAkmtaP7qQ5LZZb2V4e4mSCLorCJnsd
 iHU0hrkJ8l7aYT0h/kzToTYqYJ1OmurioXNtpmTUWpm8NrOyDcB1IL42eG6fJAUcs0MX
 dvnRdbAhL9hLL0CCNjMz/QqEtlc9xovUFVFbFNlHu0ncG4oMaX4Kt0UEE5A9FGfRHkMk
 lj+NCMzzr1X69SaB76KJ1sBwikB+SdJCNMuXD5AU+VinT7pkUlvUyaWJO7Wl62jwUpOW
 F+EXLndTap06BqBNgbTbMweIFyt3iUVVf6uzm//Bq+/r4ARL3h9nr7PSM+PML5KDiwTs
 nskg==
X-Gm-Message-State: AOAM531BqwSAEd+gu9ceAW56wfuKsY5Zm7glINlf+Ck+C8wT4waBDIM8
 c1NN99lDs3HUUwxcYSBrgDnjbMDFO6WCjA==
X-Google-Smtp-Source: ABdhPJz9PJfMPgETsz39fb1bkgTUwST3FzpFSHgZ4rS1QA3sFT5w7LasKwZSQFj5uV4xgNeytDC2pQ==
X-Received: by 2002:a17:906:cc98:: with SMTP id
 oq24mr15692123ejb.106.1600108332281; 
 Mon, 14 Sep 2020 11:32:12 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:f974:dac6:e996:e1de])
 by smtp.gmail.com with ESMTPSA id 40sm10112107edr.67.2020.09.14.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:32:11 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 20:32:05 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009142016150.6496@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1002204490-1600108331=:6496"
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

--8323329-1002204490-1600108331=:6496
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 14 Sep 2020, Dwaipayan Ray wrote:

> 
> > > The third candidate is related to the warning:
> > >
> > > WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author ...
> > >
> > > I found several such commits in which the author had used different mail addresses in the
> > > signed-off -by section, due to which this warning is generated.
> > >
> > > An example is Commit dc5bdb68b5b3 .
> > > Git log show:
> > > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ....,.
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > >
> > > This is infact a common scenario. I easily found another commit 207324a321a8.
> > > Git log shows:
> > > Author: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> > > ...
> > > Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> > >
> > > This warning could be avoided or at least handled better.
> > >
> > >
> > > I would like to know if any of them can be worked on.
> > >
> >
> > This last one might be good to look into.
> >
> > But what is your specific solution you have in mind?
> >
> > There is a file .mailmap in the repository that allows some kind of
> > mapping. Maybe that is helpful.
> >
> > I suggest that you describe your proposed change in a clear way.
> > Then, we can discuss if that change is reasonable or not.
> 
> I checked the .mailmap file and it doesn't have all the email addresses. So it might not
> be effective.
> 
> checkpatch.pl seems to compare only the email addresses to determine whether the author
> has signed off.
> 
> checkpatch, line 2673:
> if ($author ne '') {
>                 if (same_email_addresses($1, $author)) {
>                     $authorsignoff = 1;
>                 }
>             }
> 
> This causes numerous false positives if the author uses a different mail, which seems to be quite frequent.
>

But using different mail addresses should be complained about; unless we 
really have a record that these two email addresses point to the same 
person.
 
> A possible solution would be to compare the names, i.e. $1 and $author, and keep its result stored
> in some variable authorsignoff_byname. If the author's mail is not found, but his name matches, 
> there can be a better warning message on the lines of:
> "Possible missing signed-off-by line by nominal author. Author's email $email does not match signed off email.
> $email2"
> 
> Or, if the warning message cannot be changed, there could be verbose information regarding the mismatch of email.
> Is this feasible? 
> 

(Hmm, your email client is broken... lines so long...)

Sure, that is possible if the check is reasonable. But I do not understand 
what we are doing here.

It should complain when the author email and sign-off-by email does not 
match, right?

First explain:

- which situations does checkpatch.pl currently complain about?

- for which situation do you want to have more refined checks?

- why does that actually improve checkpatch.pl?

Checkpatch.pl should complain when developers do something wrong.

To really understand what is wrong behavior and what is not, you probably 
need to create some statistics on who authors and signs off with which 
names and email addresses.

Maybe we can collect all the previous instances where we know that 
frequent developers, e.g., with more >100 commits, use multiple email 
addresses interchangeably. If we add that list to the repository and
let others know how to maintain it, checkpatch.pl can make use of that.

With that extended check, we can warn newbies that just have a broken git 
and sign-off setup and still reduce the false positives for the 
experienced developers that might just have good reasons to have the 
setup they have, i.e., they have this setup for many years and want to 
keep it that way. 

You can try to work that through or look for another case of potential 
checkpatch.pl improvement in your evaluation data.

Lukas
--8323329-1002204490-1600108331=:6496
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1002204490-1600108331=:6496--
