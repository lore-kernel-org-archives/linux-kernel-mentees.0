Return-Path: <SRS0=gCq8=4I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40BAC3404C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Feb 2020 03:47:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E77A206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Feb 2020 03:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CltrD+f2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E77A206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 383148444E;
	Thu, 20 Feb 2020 03:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PsiwosCkads; Thu, 20 Feb 2020 03:47:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 450AA8436F;
	Thu, 20 Feb 2020 03:47:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F433C1D81;
	Thu, 20 Feb 2020 03:47:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9356CC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2020 03:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C69E84496
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2020 03:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-DKHd6ill56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2020 03:47:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 51CC88444F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2020 03:47:10 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gv17so295927pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 19:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4aa14Qa/BJ5gvTUkltBz2vTcHHykju1Xj4YvXyFnul4=;
 b=CltrD+f29h4W+dpxHPNv1JveX0Lnoy95RgKNGY+7Zfo42vMKUAl3DpBhUFtpbKAmo+
 QfpevgV35ksKPP2cMOjxPBJDtzA+6EXmzzPFR2GcqcmVNmp5e166xRJzoymejEvelyR/
 fPPNNfBs1MH6q+PVxSV6pB5HX8rk1Bv5c8QgpYrSqtgPqO8x+oROOZDOazO8zj+S78Wh
 DAtjtQ5KUMhzVWSa2lEpHychqhfRQOPT2dFb4IiGc1r+w1dqS32b9rrb4lOBJWHUouDJ
 CYRUTYxUYmv2miBH7fb+ahq0k67y4Y5LlQxzuOSdBrXbmZzuvcGoIo8eSS/u2MaI6Bz6
 bI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4aa14Qa/BJ5gvTUkltBz2vTcHHykju1Xj4YvXyFnul4=;
 b=E+7Muqamyh+U7gQYmPeT+9mIn/xYh3KafcWhVswFDf/vDdLtkVdi8RIV1CLDPHB4Ta
 ebBl1d9dmHYnADKsqKe7w+37JNgOoL5HeOo10XIbpGg52w0RsLjY9aqZkHY3rm5ixIw7
 7t/U+iW4Ece9CK4OJI71/7EeGGVjC4S1T4RfAY+Ny1CcIZ7VBEF6XaSWfF+FxPRZzRmB
 hSw0W2I/DYsfYRtOLDOg71AnbpWMziqWhr9EDAdEhcsRzHRnT7mdYp+N/tk2VO1pove1
 BG0vSdHdr9yqA7zPKc4e3xf56C/kWloA8uXNkrR29z0u4SgBbvG1nYfFwJB+sbNUdrBE
 72Dw==
X-Gm-Message-State: APjAAAV02GYfO4NSz003BGzDj7ekrrdTFRyzix7ZKtPqdY2S8gYcb8AX
 TZmghsA+mwlLu2mYhVk+acs=
X-Google-Smtp-Source: APXvYqx16VVAaiK+h04cWWoZZpTCTSCoAlLhOl9vCeFcmuJ7Z2LuULb7kQPW+C4OELuYq1yxtGtpRQ==
X-Received: by 2002:a17:90a:868b:: with SMTP id
 p11mr1219499pjn.60.1582170429686; 
 Wed, 19 Feb 2020 19:47:09 -0800 (PST)
Received: from workstation-portable ([146.196.37.60])
 by smtp.gmail.com with ESMTPSA id v25sm1099083pfe.147.2020.02.19.19.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 19:47:09 -0800 (PST)
Date: Thu, 20 Feb 2020 09:17:02 +0530
From: Amol Grover <frextrite@gmail.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <20200220034702.GA2349@workstation-portable>
References: <20200219100545.27397-1-frextrite@gmail.com>
 <b628d0ad-e066-46f5-5746-74dfba1816a8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b628d0ad-e066-46f5-5746-74dfba1816a8@gmail.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] tcp: Pass lockdep expression to
	RCU lists
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

On Wed, Feb 19, 2020 at 11:35:21AM -0800, Eric Dumazet wrote:
> 
> 
> On 2/19/20 2:05 AM, Amol Grover wrote:
> > tcp_cong_list is traversed using list_for_each_entry_rcu
> > outside an RCU read-side critical section but under the protection
> > of tcp_cong_list_lock.
> >
> 
> This is not true.
> 
> There are cases where RCU read lock is held,
> and others where the tcp_cong_list_lock is held.
> 

That's true but this patch specifically fixes those occurences of
list_for_each_entry_rcu() that are traversed under tcp_cong_list_lock.
Moreover, an implicit check is done for being inside RCU read-side
critical section along with testing for this newly added lockdep
expression.

> I believe you need to be more precise in the changelog.
> 
> If there was a bug, net tree would be the target for this patch,
> with a required Fixes: tag.
> 
> Otherwise, if net-next tree is the intended target, you have to signal
> it, as instructed in Documentation/networking/netdev-FAQ.rst
> 

I don't think this fixes a "bug". However, this may fix potential bugs
that may creep in. Should I send it against net-next tree?

Thanks
Amol

> Thanks.
> 
>  
> > Hence, add corresponding lockdep expression to silence false-positive
> > warnings, and harden RCU lists.
> > 
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  net/ipv4/tcp_cong.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
> > index 3737ec096650..8d4446ed309e 100644
> > --- a/net/ipv4/tcp_cong.c
> > +++ b/net/ipv4/tcp_cong.c
> > @@ -25,7 +25,8 @@ static struct tcp_congestion_ops *tcp_ca_find(const char *name)
> >  {
> >  	struct tcp_congestion_ops *e;
> >  
> > -	list_for_each_entry_rcu(e, &tcp_cong_list, list) {
> > +	list_for_each_entry_rcu(e, &tcp_cong_list, list,
> > +				lockdep_is_held(&tcp_cong_list_lock)) {
> >  		if (strcmp(e->name, name) == 0)
> >  			return e;
> >  	}
> > @@ -55,7 +56,8 @@ struct tcp_congestion_ops *tcp_ca_find_key(u32 key)
> >  {
> >  	struct tcp_congestion_ops *e;
> >  
> > -	list_for_each_entry_rcu(e, &tcp_cong_list, list) {
> > +	list_for_each_entry_rcu(e, &tcp_cong_list, list,
> > +				lockdep_is_held(&tcp_cong_list_lock)) {
> >  		if (e->key == key)
> >  			return e;
> >  	}
> > @@ -317,7 +319,8 @@ int tcp_set_allowed_congestion_control(char *val)
> >  	}
> >  
> >  	/* pass 2 clear old values */
> > -	list_for_each_entry_rcu(ca, &tcp_cong_list, list)
> > +	list_for_each_entry_rcu(ca, &tcp_cong_list, list,
> > +				lockdep_is_held(&tcp_cong_list_lock))
> >  		ca->flags &= ~TCP_CONG_NON_RESTRICTED;
> >  
> >  	/* pass 3 mark as allowed */
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
