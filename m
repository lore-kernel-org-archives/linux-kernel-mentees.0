Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A46139D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679703; cv=none; b=njurBNsHqEqcTJq/qlrKuSG3tDEuv/nYbdEnRaXsRpKNNw2qDNIJLwc0079je0lEpcQqhncPb6ryedJHfJ1EynuD7tfeLE6/rNSfwLdH7qpS/sspd4vTIoWSAK8c8DVUpusYl5FvCfW8eZ19pXOvLT9n4e4F1O5Vl2wU1hmtwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679703; c=relaxed/simple;
	bh=tD25NcdVWs3hlMpBUgKjPkntJrW9TCFnXdRsnM4/Ulo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUYZYhnhizsDo9hN3si7R/Ux98mGB3X8flfTbnI5GuZA7iB53l+uR356+t93LSdY9IdvpME+cQwOMQh6eFX/COr0cHhI3/6lVP59xAZRkNiP5PEAAzNSo9SUWm7m6mHBjEUbvYlQzOHR+WJHlda0YuUEzYJfPlWjNUCakWyeITE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=37cOTXWI; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="37cOTXWI"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE2F81088
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpVDccXmw_AA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 13:41:40 +0000 (UTC)
X-Greylist: delayed 2148 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 26 Aug 2024 13:41:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 725E880F62
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725E880F62
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=37cOTXWI
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN> 
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 725E880F62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BEP1Es6ym6Gqo8W4vOk1XZ9s/WrHy6ypMYPkbGwH5Qc=; b=37cOTXWIcoFI7JC3MpJF6+xCfr
	UHphNExENf7V7JQe03mgreYASCbWgUkLEZ96Q12Vt4htIEyt1rdMfRYZhWV+HAduNCZbUhdzUILj9
	ozMC9YmYMh8pY9SgjiUeVo1cOdQeXXpImWm/8DFYVxFHfhZU6nQSqtf4DfHG0rtzxtLI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1siZPe-005i4a-TS; Mon, 26 Aug 2024 15:05:38 +0200
Date: Mon, 26 Aug 2024 15:05:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Diogo Jahchan Koike <djahchankoike@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	christophe.leroy@csgroup.eu, linux@treblig.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+c641161e97237326ea74@syzkaller.appspotmail.com
Subject: Re: [PATCH] net: fix unreleased lock in ethnl_act_cable_test
Message-ID: <9ac272e6-b956-434b-a90b-60be6a5ad106@lunn.ch>
References: <20240826121435.88756-1-djahchankoike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826121435.88756-1-djahchankoike@gmail.com>

On Mon, Aug 26, 2024 at 09:14:15AM -0300, Diogo Jahchan Koike wrote:
> fix an unreleased lock in out_dev_put path and substitute
> both labels (out_rtnl and out_dev_put) for a simpler out.

Hi Diogo

We try to keep fixes simple. I would of changed the out_dev_put to
out_rtnl, and then removed the unused out_dev_put. That makes the
change smaller, more obviously correct.

As far as i can see, 3688ff3077d3 is only in net-next, not an -rc
kernel. As such, we want this patch added to net-next. You indicate
this in the patch Subject: [path net-next v2].

Thanks

    Andrew

---
pw-bot: cr
