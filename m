Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B731AAE0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112730; cv=none; b=g0uhBrAr63GT5iAtWrwp2kfb+zOIei+ZzUayKK0MYkA1i4X1/NzDbh/w9ahKI0FF6+zk5KvTXhBQStFv4PxfyqR1OahcnXiJrobk55f1llOg2n90HHkSUXSpkPKYXe/4FWOUc2PuazewIby1KdAlQrJwqtFVyFzTDuwiGrXMjyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112730; c=relaxed/simple;
	bh=y6qu8dBLA0LCgbdRq7LXfUlUzWcMqEAMFsWovlz6Unc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnpPlTjG/XH5UMfo/4zXqKnQLr5QwBsDQHxAV7EM9AsmIKqOUSVJV6/7q/2tk+iv3UYkMQM/C0WQzYBv05jJmb2ULoRvUtrPgC41BK6iYM8XMuEUZJsK5yRcMNDWWJ8gZR1F4+tRbuKOeFB3SBiaG0K9YR2o0v+CJGjwjEGyhK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rl8xdE18; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rl8xdE18"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACDF608EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 14:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMK2YKlYIPsa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2024 14:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E63B605EF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E63B605EF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Rl8xdE18
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4E63B605EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 14:25:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E1CCA4312A;
	Wed, 20 Nov 2024 14:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47140C4CECD;
	Wed, 20 Nov 2024 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732112725;
	bh=y6qu8dBLA0LCgbdRq7LXfUlUzWcMqEAMFsWovlz6Unc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rl8xdE186zc9YHa9wdheQGVrp4/5QVCl/CW4AkkvQbPspSciM9q9phIJJ7KChVJOW
	 oDh/GZ5uDMq1CCRL9pehXvCz2viEY8+Vk3PqLnaAArnVvuQkZAIBh2I1C4JHn+McoI
	 64SDYeJ4482YWDHNlyvI4AfZDxTcn+NDG34ctLv8=
Date: Wed, 20 Nov 2024 15:25:00 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "rbm@suse.com" <rbm@suse.com>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel-mentees@lists.linuxfoundation.org" <linux-kernel-mentees@lists.linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: remove unused sg struct member
Message-ID: <2024112037-grader-outsource-e821@gregkh>
References: <20241119212452.269255-1-luis.hernandez093@gmail.com>
 <20241119221907.tyt4luboduaymukl@synopsys.com>
 <Zz3vdkEzSobJ54bI@x13>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz3vdkEzSobJ54bI@x13>

On Wed, Nov 20, 2024 at 09:17:26AM -0500, Luis Felipe Hernandez wrote:
> Thanks, Thinh and Greg, for the feedback!
> 
> On Tue, Nov 19, 2024 at 10:19:09PM +0000, Thinh Nguyen wrote:
> > > Previously, this patch addressed a documentation warning caused by the
> > 
> > Remove this paragraph. This context only makes sense in this thread
> > where the previous patch version is visible.
> > 
> 
> I’ll update the commit message and remove the unnecessary paragraph as suggested.
> 
> > > Reported-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > 
> > I'm not the one who should be attributed to by the Reported-by tag.
> > 
> > I think Greg was alluding to this report by Stephen Rothwell:
> > https://lore.kernel.org/all/20241118194006.77c7b126@canb.auug.org.au/
> > 
> > It wasn't Cc to the linux-usb list, so I'm not sure if you've seen it.
> > If your change was base on the report above, then you can update the
> > Reported-by tag accordingly.
> > 
> 
> Regarding the report by Stephen Rothwell, I wasn’t aware of it before. I found the warning independently while trying to compile the Documentation subsystem, looking for bugs to address.
> 
> That said, now that I’m aware of Stephen’s thread, I wouldn’t mind updating the commit message to include a reference to it if you think it would help link the two discussions. Let me know your thoughts on this.

Sure, it can not hurt, as it was reported by them, and fixed by you,
everyone gets credit!

thanks,

greg k-h
