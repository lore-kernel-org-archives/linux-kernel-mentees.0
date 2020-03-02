Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE7BC3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 17:02:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF30217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 17:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF30217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98354843DB;
	Mon,  2 Mar 2020 17:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ox3dtmzXjBL5; Mon,  2 Mar 2020 17:02:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DB2B8472A;
	Mon,  2 Mar 2020 17:02:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A88C1AE2;
	Mon,  2 Mar 2020 17:02:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04086C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E2E9085B0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XfnffeJyHQRg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:02:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C17C85ADC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 17:02:33 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a20so1746995otl.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 09:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3E3fWxDEv9ZHfmOkcec5gIIJeOvKCzK/ypdiNkYfC8Q=;
 b=LcJGoL+VuFayX4pTHqB6wb3JUI2tmGVO8ww5eLJ6EG4hbK4TcCIY7CcuwXYa6NIg0a
 LJWwdPq81RzjMsCaUSnBPWZ5m5SPN7emu4sjxjPaUc4oniLnKKchBFGb5HRNp2oCjUUl
 1ps80dMCPmcbwbLPPP9deuPfUSUxONIgfIFMkKx5QalfKnGIxghf9dyXFl2nmYZJauB6
 dFepnt6xsNfByunlmdWM87TbOQHF7w4lhqsVg1Yher4Wu5iuFVbfXhlvJ8jeaFI0HfVn
 BPeir36H/L+Sbx/lqZ++1Ra113QquI4rfUG9fexa8v7buslQvaOQ217+c1qgWmKGNJkS
 usxw==
X-Gm-Message-State: ANhLgQ0euxN2W3ZUv59roDnqyg+8/kV4EBI3H5DkDpUjWVPjorqtTrrO
 baj4rU3Pul3wYUuXaRUQyPTI+lx27S9bQYx00VI=
X-Google-Smtp-Source: ADFU+vtrrwRitcEkkYBbTuh1knba7jp5gALhcQEhCs5xZDWVZPrBv0NBfHT14a2k5mSe4rTQlRheR8mZvBJynFnoa78=
X-Received: by 2002:a9d:67d7:: with SMTP id c23mr125593otn.262.1583168552404; 
 Mon, 02 Mar 2020 09:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
 <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
 <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
 <CAJZ5v0jTSKd_23fJhM+XUmFX_yTjcD+c_s1Jvi3HA1EmXPkzZw@mail.gmail.com>
 <CAEXW_YRL0kum5yVm+9V8i_PK2FcHfPeUOxJKZ+T8P3zqhATxJg@mail.gmail.com>
 <CAD=jOEZ3vdNC4qTMxptaXLjs7i8TCTYjeiv9vXhcapLSkrr9RQ@mail.gmail.com>
In-Reply-To: <CAD=jOEZ3vdNC4qTMxptaXLjs7i8TCTYjeiv9vXhcapLSkrr9RQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 2 Mar 2020 18:02:21 +0100
Message-ID: <CAJZ5v0hee4FxeVub_ZkAYn9z8q1_ZLA_AcmTtS-w39VzSe0UxA@mail.gmail.com>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Cc: Len Brown <len.brown@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main:
	Use built-in RCU list checking
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

On Mon, Mar 2, 2020 at 1:34 PM Madhuparna Bhowmik
<madhuparnabhowmik10@gmail.com> wrote:
>
>
>
> On Mon, 2 Mar, 2020, 3:48 AM Joel Fernandes, <joel@joelfernandes.org> wrote:
>>
>> On Sun, Mar 1, 2020 at 4:23 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>> >
>> > On Sun, Mar 1, 2020 at 9:53 PM <joel@joelfernandes.org> wrote:
>> > >
>> > >
>> > >
>> > > On March 1, 2020 3:12:53 PM EST, "Rafael J. Wysocki" <rafael@kernel.org> wrote:
>> > > >On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com> wrote:
>> > > >>
>> > > >> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> > > >>
>> > > >> This patch passes the cond argument to list_for_each_entry_rcu()
>> > > >> to fix the following false-positive lockdep warnings:
>> > > >>
>> > > >> [  330.302784] =============================
>> > > >> [  330.302789] WARNING: suspicious RCU usage
>> > > >> [  330.302796] 5.6.0-rc1+ #5 Not tainted
>> > > >> [  330.302801] -----------------------------
>> > > >> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in
>> > > >non-reader section!!
>> > > >>
>> > > >> [  330.303303] =============================
>> > > >> [  330.303307] WARNING: suspicious RCU usage
>> > > >> [  330.303311] 5.6.0-rc1+ #5 Not tainted
>> > > >> [  330.303315] -----------------------------
>> > > >> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in
>> > > >non-reader section!!
>> > > >>
>> > > >> [  331.934969] =============================
>> > > >> [  331.934971] WARNING: suspicious RCU usage
>> > > >> [  331.934973] 5.6.0-rc1+ #5 Not tainted
>> > > >> [  331.934975] -----------------------------
>> > > >> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in
>> > > >non-reader section!!
>> > > >>
>> > > >> [  332.467772] WARNING: suspicious RCU usage
>> > > >> [  332.467775] 5.6.0-rc1+ #5 Not tainted
>> > > >> [  332.467775] -----------------------------
>> > > >> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in
>> > > >non-reader section!!
>> > > >
>> > > >I don't see these warnings in the kernels run locally here.
>> > > >
>> > > >What do you do to get them?
>> > > >
>> > > >Joel, any comments here?
>> > >
>> > > You have to enable lockdep in your config. Does your setup have that?
>> >
>> > CONFIG_LOCK_DEBUGGING_SUPPORT=y
>> > CONFIG_PROVE_LOCKING=y
>> > CONFIG_DEBUG_SPINLOCK=y
>> > CONFIG_DEBUG_LOCK_ALLOC=y
>> > CONFIG_LOCKDEP=y
>>
>>
> I had CONFIG_PROVE_RCU_LIST = y and I think these warnings were triggered when I had closed my laptop (like just close without shutting down).

OK, so let's define a macro for that in this file to avoid code duplication.

And analogously in the second patch.

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
