Return-Path: <SRS0=Jgkt=7V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D506C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 04:17:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06CB520774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 04:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06CB520774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2EA987D60;
	Mon,  8 Jun 2020 04:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhacWqajh3Cc; Mon,  8 Jun 2020 04:17:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 752F087BC8;
	Mon,  8 Jun 2020 04:17:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BD5FC0890;
	Mon,  8 Jun 2020 04:17:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 284AFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 04:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1DCD786614
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 04:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNvruJMVwION
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 04:17:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE909865C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 04:17:36 +0000 (UTC)
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 56612E4C; Sun,  7 Jun 2020 23:17:34 -0500 (CDT)
Date: Sun, 7 Jun 2020 23:17:34 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20200608041734.GA10911@mail.hallyn.com>
References: <20200406105950.GA2285@workstation-kernel-dev>
 <20200607062340.7be7e8d5@canb.auug.org.au>
 <20200607190840.GG4455@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607190840.GG4455@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Serge E . Hallyn" <serge@hallyn.com>
Subject: Re: [Linux-kernel-mentees] [PATCH RESEND] device_cgroup: Fix RCU
	list debugging warning
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

On Sun, Jun 07, 2020 at 12:08:40PM -0700, Paul E. McKenney wrote:
> On Sun, Jun 07, 2020 at 06:23:40AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 6 Apr 2020 16:29:50 +0530 Amol Grover <frextrite@gmail.com> wrote:
> > >
> > > exceptions may be traversed using list_for_each_entry_rcu()
> > > outside of an RCU read side critical section BUT under the
> > > protection of decgroup_mutex. Hence add the corresponding
> > > lockdep expression to fix the following false-positive
> > > warning:
> > > 
> > > [    2.304417] =============================
> > > [    2.304418] WARNING: suspicious RCU usage
> > > [    2.304420] 5.5.4-stable #17 Tainted: G            E
> > > [    2.304422] -----------------------------
> > > [    2.304424] security/device_cgroup.c:355 RCU-list traversed in non-reader section!!
> > > 
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  security/device_cgroup.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/security/device_cgroup.c b/security/device_cgroup.c
> > > index 7d0f8f7431ff..b7da9e0970d9 100644
> > > --- a/security/device_cgroup.c
> > > +++ b/security/device_cgroup.c
> > > @@ -352,7 +352,8 @@ static bool match_exception_partial(struct list_head *exceptions, short type,
> > >  {
> > >  	struct dev_exception_item *ex;
> > >  
> > > -	list_for_each_entry_rcu(ex, exceptions, list) {
> > > +	list_for_each_entry_rcu(ex, exceptions, list,
> > > +				lockdep_is_held(&devcgroup_mutex)) {
> > >  		if ((type & DEVCG_DEV_BLOCK) && !(ex->type & DEVCG_DEV_BLOCK))
> > >  			continue;
> > >  		if ((type & DEVCG_DEV_CHAR) && !(ex->type & DEVCG_DEV_CHAR))
> > > -- 
> > > 2.24.1
> > > 
> > 
> > I have been carrying the above patch in linux-next for some time now.
> > I have been carrying it because it fixes problems for syzbot (see the
> > third warning in
> > https://lore.kernel.org/linux-next/CACT4Y+YnjK+kq0pfb5fe-q1bqe2T1jq_mvKHf--Z80Z3wkyK1Q@mail.gmail.com/).
> > Is there some reason it has not been applied to some tree?
> 
> The RCU changes on which this patch depends have long since made it to
> mainline, so it can go up any tree.  I can take it if no one else will,
> but it might be better going in via the security tree.
> 
> 							Thanx, Paul

James, do you mind pulling it in?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
