Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59871C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:01:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5760206BE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uKz7auab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5760206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ABCEB87303;
	Wed, 16 Sep 2020 07:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnsCxH8BP47l; Wed, 16 Sep 2020 07:01:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E389A872A7;
	Wed, 16 Sep 2020 07:01:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD1F3C0859;
	Wed, 16 Sep 2020 07:01:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6C68C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF96E86E86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l+epAhqF72if
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D29A986E72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:01:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id s13so1651228wmh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=nXiBPigpkYRPh49jh2vlBtTHNWkPUXaxw+7W2FhLyoA=;
 b=uKz7auabvRsxcF2nLRJNfAqTAkHyyctqxsd1Cmh2e7I+DxubRyJys0yzlZQVg6Lzxs
 j+UHyLRPbehdMex6wFwSihQmOviiHKBuc2INY/y0tYbfQ9kq1LX19XJkKTxO2IOHFNXJ
 N6mwZG3gKVmm/siv2AOaHncHjeKqDlbPt82dESKz4JCycPqm93iUSf+P5+yt1njbLdLM
 aozV23KQxCG+UFBjHI1N918vZbDV+zMNOFWepQ1rRY2EwmCjnSZK2OHqKY1BpPtHFs4i
 VllvzSCN7BOCFcI9/exUA7sIgjfC1HXDBOPauxd++3rdD0o8LxXwvIuJcpHFijPcUB6r
 sf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=nXiBPigpkYRPh49jh2vlBtTHNWkPUXaxw+7W2FhLyoA=;
 b=F+qyxIkSA8zgsH6Yj6tJ6UWkJKbh5feZMc9XoCyck4V1dTTIz4MkBe4bw1ipqCIRxG
 CV60Jr4U/ym8Jyxv06tNEfpeZ0WWiIHUIsZng9EKKTtjMbWFmPEKRvymMfVnWhWvD7ku
 IPkl2tSRhD6e8J5Njx/w5kq+g2Qk5mq1+1QW3ni8CbaaLPsq1L0NUbaIMqZoGM5JvjJA
 fu1/mm/8RC64bbpK+bzZdEbpeQTTiSRCgXVuXxvOYvQZ4WoSMHaZWvyg8bplzNNKEPZ6
 PywX/Lo8Sr94Y6+QawkDVL3sCf6YociW9djgM5QBnBk7Dt2i3jlF6cy8KLqOKQrmPiZF
 ytcw==
X-Gm-Message-State: AOAM532/hjAtIknGo2zOGIzpavpXXyCk8rr5McXOCUEFR+e8eA+Lim8z
 PO7aGCqNr6ggfntbJivjimE=
X-Google-Smtp-Source: ABdhPJzkFUxdpfvcGCcKWUcRV3f/7W197hboGq0OVqwXYLjckoIaWb+f+GV1RYbJKChs/QsJAfxSSw==
X-Received: by 2002:a1c:5685:: with SMTP id k127mr3148862wmb.135.1600239708070; 
 Wed, 16 Sep 2020 00:01:48 -0700 (PDT)
Received: from felia ([2001:16b8:2dec:c500:15b1:3554:3841:68b])
 by smtp.gmail.com with ESMTPSA id j10sm32504382wrn.2.2020.09.16.00.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 00:01:47 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 16 Sep 2020 09:01:41 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009160837380.10877@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
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
 <alpine.DEB.2.21.2009142016150.6496@felia>
 <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1918656384-1600239707=:10877"
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

--8323329-1918656384-1600239707=:10877
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 15 Sep 2020, Dwaipayan Ray wrote:

> Hi,
> Sorry for the late reply.
> 
> > First explain:
> >> - which situations does checkpatch.pl currently complain about?
> >
> Currently, checkpatch complains whenever the author mail is not
> found in any signed-off-by block in the patch.
> 

Generally, this makes sense, right?

The author shall also sign-off the patch.

Now, the question is how to determine identities?

We have two bits of information, the name and the email.

So, there are three options to define 'identity':

A. the name and the email needs to match.
B. at least, the name needs to match
C. at least, the email needs to match

I believe A. is perfect; B and C deserve at least a note from 
checkpatch.pl.

> 
> > - for which situation do you want to have more refined checks?
> >
> The situations where author might have signed off using a different
> email. I believe multiple mail addresses isn't uncommon.
>

Yes, but who is doing it on purpose, and who is doing it by mistake.

We need numbers. How often is A met? How often is B met? How often is C 
met?

We can improve the identity check, but it probably needs more thought than 
the email does not need to match, but the name does. That will probably 
just show more cases where the name does not match, but the email does.

> 
> > - why does that actually improve checkpatch.pl?
> 
> It shall significantly reduce the number of author_sign_off warnings. I have
> not yet created a statistical count, but looking at the data I found several
> such instances. This is certainly a false positive due to a condition which
> checkpatch was not programmed to handle.
> The avoidance of warnings on such known cases might also save the 
> committer and the maintainers some time.
>

Hmm, not really a good rationale yet. How about deleting checkpatch.pl 
completely? Then it cannot complain either. No false positives, no problem 
:)

Maybe it was not programmed to handle that on purpose, e.g., it was a 
clear design decision to check if at least the email is met.

Check the git history of checkpatch.pl with git blame and you will know 
more. You need to understand the history of this check and warning.

> 
> > Checkpatch.pl should complain when developers do something wrong.
> >
> > To really understand what is wrong behavior and what is not, you probably
> > need to create some statistics on who authors and signs off with which
> > names and email addresses.
> >
> > Maybe we can collect all the previous instances where we know that
> > frequent developers, e.g., with more >100 commits, use multiple email
> > addresses interchangeably. If we add that list to the repository and
> > let others know how to maintain it, checkpatch.pl can make use of that.
> >
> > With that extended check, we can warn newbies that just have a broken git
> > and sign-off setup and still reduce the false positives for the
> > experienced developers that might just have good reasons to have the
> > setup they have, i.e., they have this setup for many years and want to
> > keep it that way.
> 
> This seems like a great idea. I can load the mailmap data into checkpatch
> and form some kind of map between names and mail addresses. 
> If two mail addresses belong to same user then the warning can be ignored
> totally.
>

Please check with an evaluation if that makes a big difference, though.
We have other sources to determine identities as well.
 
> I know that the kernel community is strict about such changes. So will this be
> acceptible? I can generate a proof of concept patch with the data at hand
> if it seems like a good thing to work on.
>

If you do your homework, proper research what was decided in the past, 
proper evaluations what the difference of your change is, proper 
implementation, proper arguments for your change, it has high chances of 
being accepted. Many agree that checkpatch.pl can be useful, but many 
agree that it needs some improvements.

It is certainly not a quick improvement, and needs some thought to make it 
really better.

> 
> > You can try to work that through or look for another case of potential
> > checkpatch.pl improvement in your evaluation data.
> 
> I haven't found anything substantial yet. I will continue looking. 
> Earlier, you had told if I would like to take the task from Ayush to
> fix checkpatch with git ranges. I would like to know about the task
> and take it up if possible.
>

Please reach out to Ayush to understand the encountered issue and CC: this 
mailing list.

I know there are more issues that checkpatch.pl can be improved with, keep 
looking :)


Lukas
--8323329-1918656384-1600239707=:10877
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1918656384-1600239707=:10877--
