Return-Path: <SRS0=HLeX=4H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA006C3524E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 21:30:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A40724656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 21:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A40724656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66C0187916;
	Wed, 19 Feb 2020 21:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NStE-nsM8uMo; Wed, 19 Feb 2020 21:30:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E0F0879A3;
	Wed, 19 Feb 2020 21:30:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73C75C1D81;
	Wed, 19 Feb 2020 21:30:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17167C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 01D7484854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ntt5Id95KstY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:30:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BAF358443F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:30:02 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1j4Wuf-00AJkC-UU; Wed, 19 Feb 2020 22:29:46 +0100
Message-ID: <855dec1f598d8b43400089cd0c5a7ac9b3533fc7.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>, Amol Grover
 <frextrite@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 22:29:43 +0100
In-Reply-To: <407d6295-6990-4ef6-7d36-e08a942607c8@broadcom.com>
 (sfid-20200219_222746_459969_817073EC)
References: <20200219091102.10709-1-frextrite@gmail.com>
 <ff8a005c68e512cb3f338b7381853e6b3a3ab293.camel@sipsolutions.net>
 <407d6295-6990-4ef6-7d36-e08a942607c8@broadcom.com>
 (sfid-20200219_222746_459969_817073EC)
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] cfg80211: Pass lockdep
	expression to RCU lists
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

On Wed, 2020-02-19 at 22:27 +0100, Arend Van Spriel wrote:
> On 2/19/2020 10:13 AM, Johannes Berg wrote:
> > On Wed, 2020-02-19 at 14:41 +0530, Amol Grover wrote:
> > >   
> > > -	WARN_ON_ONCE(!rcu_read_lock_held() && !lockdep_rtnl_is_held());
> > > -
> > > -	list_for_each_entry_rcu(pos, &rdev->sched_scan_req_list, list) {
> > > +	list_for_each_entry_rcu(pos, &rdev->sched_scan_req_list, list,
> > > +				lockdep_rtnl_is_held()) {
> > 
> > Huh, I didn't even know you _could_ do that :)
> 
> Me neither ;-). Above you are removing the WARN_ON_ONCE() entirely. 
> Would it not be good to keep the WARN_ON_ONCE() with only the 
> !rcu_read_lock_held() check.

Not needed, the macro expansion will already contain
rcu_read_lock_any_held() just like in all the other cases where you pass
a lockdep condition to RCU helpers.

johannes

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
