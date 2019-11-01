Return-Path: <SRS0=TMUh=YZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB82ECA9ECE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 07:53:11 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFBC21734
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 07:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHz7eIoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFFBC21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 695EB6785;
	Fri,  1 Nov 2019 07:53:11 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0C978641A
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 07:53:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B714A466
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 07:53:09 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
	[50.39.105.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 88CDC2080F;
	Fri,  1 Nov 2019 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572594789;
	bh=VXpWqY01SDpgB8O1tjrELEhTWmvnU/VWql3TetZxFMY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qHz7eIoZKQmC0/Rha3kHXDK1mg18t4hyHvyH7bfHnIxuQnZfum3oj5nhs6tULtSQN
	OL/ixtmbI0iRXe3plF5EbKVdWBF9vf/Iec5Qc4WFcv993SqV8rQKfyP60Cre4PqoYY
	hXUBxvgoQcB/CacmFA2PZAxw+BixqbAOVKIgIvpw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 55A1635207E6; Fri,  1 Nov 2019 00:53:09 -0700 (PDT)
Date: Fri, 1 Nov 2019 00:53:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Phong Tran <tranmanphong@gmail.com>
Message-ID: <20191101075309.GH20975@paulmck-ThinkPad-P72>
References: <20191030233128.14997-1-tranmanphong@gmail.com>
	<20191031225439.GD20975@paulmck-ThinkPad-P72>
	<35bb2f18-791a-caf3-957d-01e43a4b3afc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35bb2f18-791a-caf3-957d-01e43a4b3afc@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc: convert whatisRCU.txt to rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191101075309.da_jHsFru7nA4d23NXNf4zQWA-158a-1YDsjVMXZoHE@z>

On Fri, Nov 01, 2019 at 08:17:36AM +0700, Phong Tran wrote:
> Hi Paul,
> On 11/1/19 5:54 AM, Paul E. McKenney wrote:
> > Could you and Madhuparna please review and test each other's
> > .rst-conversion patches?
> 
> It's fine.
> pull and "make SPHINXDIRS="RCU" htmldocs pdfdocs" rcu dev branch
> without error or warning.

Very good, thank you!

Once you have done that (or if you have already done that) and have
verified that the resulting .html and .pdf files for the changed portions
look good, you can respond with a Tested-by tag, which has "Tested-by:",
your name, and your email within "<" and ">".  For example, commit
127068abe85b ("i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga
C630") has this:

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

After you review the code, for example, by checking either the patch or the
resulting .rst file, you can respond with a very similar Reviewed-by tag.
Which allows you to get a start on participating in the code-review
process.

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
