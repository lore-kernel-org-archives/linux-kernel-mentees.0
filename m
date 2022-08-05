Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F165C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 09:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C909E41D81;
	Fri,  5 Aug 2022 09:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C909E41D81
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=JrkzXZwE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vd60JjL6HR1N; Fri,  5 Aug 2022 09:35:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B9ABF41D63;
	Fri,  5 Aug 2022 09:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9ABF41D63
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 917C9C0033;
	Fri,  5 Aug 2022 09:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3646C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9942A41C82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9942A41C82
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=JrkzXZwE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHr6KXqFpcJP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5792841C7D
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5792841C7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 09:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659692143; cv=none; d=zohomail.in; s=zohoarc; 
 b=HdRixjmY7k8QmEF2vJHaiZupbePpR/Hu1Oqp9XUbYzHXJGRTY3+pm0yWidT675bqbaYBpS9HveNo4tO6DX0V8Gzk+eVexXVxsYc3dCu1KOboGGBC0A67zBjRpKTwsh0ZzER0wItw+t5xXRsCd1CMYjOndNwUoPNbPGiLQRv5Wvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659692143;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=G8MsDCNn/ZMR+NcTrqGGmERIgvdoqAtb+ck1u1WQQns=; 
 b=Exz9DJO9SDONKHw3+wLd5DntW4JHs7hNnUWnzSJFsVa5TaX58Gy0Z65JPCCgzzYRPsexWzzgB3a3i43nFjnFWJOLJwtdPDn+1Cl/8G329zudX5fcYM2W7e8cHwsB3qviaQcI7dAaYwu1xWtaroSGz52UyeuY1lGsHXWuZGOqBZ0=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659692143; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=G8MsDCNn/ZMR+NcTrqGGmERIgvdoqAtb+ck1u1WQQns=;
 b=JrkzXZwEhfuPxSVR+Vtx8JiRjTCCR+078sCcwoc2XKVOp6jwNyuxjNbF4BTDvACx
 WBh2BHk5ED7fRmznza4E1R2XiZGWQzDgTDBnEH6ZvThDH8RJ+QD0acm3ris8YM7SL6u
 sQYJkdV+mtVaHNQ6X3jRDTAGUZW8kL1jNbYxw9E0=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659692132718539.7638172100387;
 Fri, 5 Aug 2022 15:05:32 +0530 (IST)
Date: Fri, 05 Aug 2022 15:05:32 +0530
To: "Eric Biggers" <ebiggers@kernel.org>
Message-ID: <1826d5c2956.568f80f5118689.2103252186884814555@siddh.me>
In-Reply-To: <YuzFIx36zDXX0z/0@sol.localdomain>
References: <cover.1659618705.git.code@siddh.me>
 <6bac2d4c2b50d921eb16fa5344ffe258be90c651.1659618705.git.code@siddh.me>
 <YuzFIx36zDXX0z/0@sol.localdomain>
Subject: Re: [PATCH 2/3] kernel/watch_queue: Improve struct annotation
 formatting
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 05 Aug 2022 12:52:11 +0530  Eric Biggers  wrote:
> On Thu, Aug 04, 2022 at 07:00:23PM +0530, Siddh Raman Pant wrote:
> > Improve formatting struct annotations in watch_queue.h, so that they
> > fall in the preferred 80 character limit.
> > 
> > Signed-off-by: Siddh Raman Pant code@siddh.me>
> 
> This patch isn't just fixing overly long lines, but rather is introducing
> kerneldoc comments and documenting things that weren't documented before.
> That's fine, but please make the commit message accurately describe the patch.
> 
> > diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
> > index fc6bba20273b..c99c39ec6548 100644
> > --- a/include/linux/watch_queue.h
> > +++ b/include/linux/watch_queue.h
> > @@ -18,57 +18,103 @@
> >  
> >  struct cred;
> >  
> > +/**
> > + * watch_type_filter - Filter on watch type
> 
> If you're going to use kerneldoc comments, they should be correctly formatted.
> This is not, since it's missing the word struct.  You can run this command to
> see the kerneldoc warnings:
> 
> 	./scripts/kernel-doc -v -none include/linux/watch_queue.h
> 
> > + * @lock: Spinlock
> 
> Please make sure that comments provide useful information and don't just repeat
> what the code says.
> 
> - Eric
> 

Okay, will do.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
