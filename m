Return-Path: <SRS0=i9XN=4B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA31CC2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 13:04:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CC024650
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 13:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS8Dc8pF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CC024650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2971E20411;
	Thu, 13 Feb 2020 13:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsspMDLZ5Gog; Thu, 13 Feb 2020 13:04:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5697D20358;
	Thu, 13 Feb 2020 13:04:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E046C08A4;
	Thu, 13 Feb 2020 13:04:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 043B0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 13:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F33C120411
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 13:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FS7hXX5lgemG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 13:04:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id E94C121517
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 13:04:10 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 77so5466752oty.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 05:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0adB+pt4qh1OaTMfcot+CB7VlM3xlqwZE8/MPGMlo18=;
 b=NS8Dc8pFZ/7KzwYyztK06wo2fsUH6hYpT2WDma2QuQjZFYqSp8rrXFU+RY00kN6Y/9
 oddxJ9ID4bE35Hx6odPhqy3eH/fBVz1r1vEUMWKSBQu3tS964k0Bkoeh8CD28Za40Y/A
 QnvqmnYp9dwUSQLDusy3v0bDsHSCjYDQh5INRrCBD1LF75hZIKkjyFWgeKfIhddnaitC
 GGY0QuyWCrVJn+3AN341O04AFg0zpeQMSpsOPfkh0niNKYrRQSka563XfPEPa8AfnNbZ
 dFl291zS+Fjw4iNro/6KKF62pYJiHT6tV5wIudqoQMcROo+FthxlrFgYTKVz/nEPWYw9
 GcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=0adB+pt4qh1OaTMfcot+CB7VlM3xlqwZE8/MPGMlo18=;
 b=lTa0xI4I3Jfy2Pn7qcchfiQJ53ol6Yk4SoJidkZ8jBIFGUbQUnTgNeOBqWy+faJ9Z0
 soA+W+jRN22T/RenWjuwFCKDlWfR7aoVacjrY/mZ4p2klQADJzBExUil39HHCV5pPq4e
 7e5UUpGUoIcEQCLZvE5juwegZYUKK+9BIKV+0mLLQrEkTLmQSp/RcHYLkhMMiWQeICHW
 R2kk2YkpdDObQrZ8bsBDeKck2oZXkmtqoP4bO9sHuc8pLqxDOkxBXB9DEkJONdsAY3uH
 moPg5WKxCi8gXk2x5Xsx0jLj50Q6LdIT9xwxze1LZBW2TPwXyrYKQbgAQDJ5AhkE+ZMb
 OW+w==
X-Gm-Message-State: APjAAAWi0nIBuE9k/u9iH60d+6Z8jYW9Igwlbu6x1RuFPHAlFqvyOtWx
 iurhX1tlc96HXwAmfRk9aQ==
X-Google-Smtp-Source: APXvYqzkJVtsmAZGdGeqZM9cgu3uJE+vU03NBbc9q4BAapKFdd2bc55PSaWCVEKdbndFoe2bV1EQig==
X-Received: by 2002:a05:6830:22e2:: with SMTP id
 t2mr13583494otc.129.1581599050001; 
 Thu, 13 Feb 2020 05:04:10 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id 32sm772548ott.38.2020.02.13.05.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 05:04:09 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:e166:6491:dd75:4196])
 by serve.minyard.net (Postfix) with ESMTPSA id F047C180053;
 Thu, 13 Feb 2020 13:04:08 +0000 (UTC)
Date: Thu, 13 Feb 2020 07:04:07 -0600
From: Corey Minyard <minyard@acm.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20200213130407.GQ7842@minyard.net>
References: <20200117132521.31020-1-frextrite@gmail.com>
 <20200212134552.GN7842@minyard.net>
 <20200212214956.GT2935@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212214956.GT2935@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 openipmi-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] drivers: char: ipmi:
 ipmi_msghandler: Pass lockdep expression to RCU lists
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
Reply-To: minyard@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Feb 12, 2020 at 01:49:56PM -0800, Paul E. McKenney wrote:
> On Wed, Feb 12, 2020 at 07:45:52AM -0600, Corey Minyard wrote:
> > On Fri, Jan 17, 2020 at 06:55:22PM +0530, Amol Grover wrote:
> > > intf->cmd_rcvrs is traversed with list_for_each_entry_rcu
> > > outside an RCU read-side critical section but under the
> > > protection of intf->cmd_rcvrs_mutex.
> > > 
> > > ipmi_interfaces is traversed using list_for_each_entry_rcu
> > > outside an RCU read-side critical section but under the protection
> > > of ipmi_interfaces_mutex.
> > > 
> > > Hence, add the corresponding lockdep expression to the list traversal
> > > primitive to silence false-positive lockdep warnings, and
> > > harden RCU lists.
> > > 
> > > Add macro for the corresponding lockdep expression to make the code
> > > clean and concise.
> > > 
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > 
> > After reading everything, I think this is correct, but I would like
> > Paul's stamp of approval on this.
> 
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> 
> But note that I did not trace the locking in the case of ipmi_add_smi().
> I did the others, so lockdep can do the last one.  ;-)

Thanks, it's in my queue for 5.7.

-corey

> 
> 							Thanx, Paul
> 
> > Thanks,
> > 
> > -corey
> > 
> > > ---
> > > v3:
> > > - Remove rcu_read_lock_held() from lockdep expression since it is
> > >   implicitly checked.
> > > - Remove unintended macro usage.
> > >  
> > > v2:
> > > - Fix sparse error
> > >   CHECK: Alignment should match open parenthesis
> > > 
> > >  drivers/char/ipmi/ipmi_msghandler.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > > index cad9563f8f48..64ba16dcb681 100644
> > > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > > @@ -618,6 +618,8 @@ static DEFINE_MUTEX(ipmidriver_mutex);
> > >  
> > >  static LIST_HEAD(ipmi_interfaces);
> > >  static DEFINE_MUTEX(ipmi_interfaces_mutex);
> > > +#define ipmi_interfaces_mutex_held() \
> > > +	lockdep_is_held(&ipmi_interfaces_mutex)
> > >  static struct srcu_struct ipmi_interfaces_srcu;
> > >  
> > >  /*
> > > @@ -1321,7 +1323,8 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
> > >  	 * synchronize_srcu()) then free everything in that list.
> > >  	 */
> > >  	mutex_lock(&intf->cmd_rcvrs_mutex);
> > > -	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
> > > +	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> > > +				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
> > >  		if (rcvr->user == user) {
> > >  			list_del_rcu(&rcvr->link);
> > >  			rcvr->next = rcvrs;
> > > @@ -1599,7 +1602,8 @@ static struct cmd_rcvr *find_cmd_rcvr(struct ipmi_smi *intf,
> > >  {
> > >  	struct cmd_rcvr *rcvr;
> > >  
> > > -	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
> > > +	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> > > +				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
> > >  		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
> > >  					&& (rcvr->chans & (1 << chan)))
> > >  			return rcvr;
> > > @@ -1614,7 +1618,8 @@ static int is_cmd_rcvr_exclusive(struct ipmi_smi *intf,
> > >  {
> > >  	struct cmd_rcvr *rcvr;
> > >  
> > > -	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link) {
> > > +	list_for_each_entry_rcu(rcvr, &intf->cmd_rcvrs, link,
> > > +				lockdep_is_held(&intf->cmd_rcvrs_mutex)) {
> > >  		if ((rcvr->netfn == netfn) && (rcvr->cmd == cmd)
> > >  					&& (rcvr->chans & chans))
> > >  			return 0;
> > > @@ -3450,7 +3455,8 @@ int ipmi_add_smi(struct module         *owner,
> > >  	/* Look for a hole in the numbers. */
> > >  	i = 0;
> > >  	link = &ipmi_interfaces;
> > > -	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link) {
> > > +	list_for_each_entry_rcu(tintf, &ipmi_interfaces, link,
> > > +				ipmi_interfaces_mutex_held()) {
> > >  		if (tintf->intf_num != i) {
> > >  			link = &tintf->link;
> > >  			break;
> > > -- 
> > > 2.24.1
> > > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
