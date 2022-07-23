Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F883C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 15:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C30984166D;
	Sat, 23 Jul 2022 15:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C30984166D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=AX7PeCKi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q69uqf-iBxCI; Sat, 23 Jul 2022 15:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C72FB404DF;
	Sat, 23 Jul 2022 15:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C72FB404DF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFA7FC0033;
	Sat, 23 Jul 2022 15:28:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8297C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81C9241697
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C9241697
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=AX7PeCKi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCxyxZvfIbJI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1284169E
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC1284169E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658590106; cv=none; d=zohomail.in; s=zohoarc; 
 b=Lyjuq3kiDlanKDvP/FngdV62QpvsxmDaU5Bf+c3GbUalfmW6ZEWpY05vprmkOb4UKS1qt9ui3VWDaJHnbOE5c/Ws2a8QSNyl0bCZvnL7e0A3xHSK3iCcY/I81QtLtdZNctgc6wJI/7yZsTiROcQxouOXIsTPTQJvxzSTT+dpVbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658590106;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=QUHKy4OgEaxbVLogauALC7ife9v5t5FcKwUzAh8eIRk=; 
 b=d8O36cgk9f1UBst/XKKzVWaBE4ME9VwSVq+41afy41XVED9ZLZrF9mRmn80zvSHR3nK32RNEoDz6j4UPV0Kb3K7Cy0g6aQlmJgKl9zLhl8HGccPL9G27/yLAnMH6ZNgCHtZXgZOtZHG7rIrNuNZs+uPhCO4HQ00IzVifsYwENcI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658590106; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=QUHKy4OgEaxbVLogauALC7ife9v5t5FcKwUzAh8eIRk=;
 b=AX7PeCKipWcL4pk8J9TO01kdzl+FTf3hwvGlt+7TUbONwtwX2oQ4FVcUxIkFRrnp
 95+19S3rjYI8FzxWHoruMEhjExplwoKmgzCItwqK8hXj2lryYStue6oE1zPGifkDdXB
 Nmece5GqZ/d/8lyQkNlSscw9ZzenEB8oS+K38+bk=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658590095403354.57172593740086;
 Sat, 23 Jul 2022 20:58:15 +0530 (IST)
Date: Sat, 23 Jul 2022 20:58:15 +0530
To: "James Bottomley" <James.Bottomley@HansenPartnership.com>
Message-ID: <1822bac680f.53b862f8236953.7679004564726067655@siddh.me>
In-Reply-To: <f58c2c8a157714e1860caee9bb005ec469ddb72e.camel@HansenPartnership.com>
References: <20220723135035.199188-1-code@siddh.me>
 <YtwAHGISvlgXgXZM@kroah.com>
 <1822b7c129a.14411444236159.6380883938307880248@siddh.me>
 <f58c2c8a157714e1860caee9bb005ec469ddb72e.camel@HansenPartnership.com>
Subject: Re: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
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

On Sat, 23 Jul 2022 20:20:49 +0530  James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> That doesn't apply in this case, does it?  watch and wlist are locally
> allocated and neither has been made externally visible if the error leg
> is taken, so they should just be locally freed, which is what the code
> was doing before this proposed patch.

You are correct.

Sorry for this, I should have looked at it for a tad bit more.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
