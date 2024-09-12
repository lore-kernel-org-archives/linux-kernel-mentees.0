Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB03188CA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 05:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726117613; cv=none; b=V0qPbRDEIQcYmULwTNTVXkpmKSVI00o/PV3SQS7DDOxejtqQOVFKMflWdZMCMPn3GkVttiGJiZKUWzdBX0JQjJP/XL9z+Myk/d9siVP4QDtf9iua69TQJ7mqZuKynrDqOkwGNE8tZ0Em0Mk7iK/haGLzEG08aYXF+OQ9x7eE7XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726117613; c=relaxed/simple;
	bh=PSBPRfpXCTFazNXYG5W2cn6TzhVgjMf+nyJ5Kwf2BV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Joz2GYF0OKxeeFZEV81RDyesW8To6C6QHBGePEWeEvd560V6xN1XdXown/OFcYM8KudXtvfpdQiFia4MWB6vfvzeo+FU7SEhgYAuQ/5HiZZZQexem5U2ivDmZHOPFvLGDMX7RUzCe6u2l0oNdLYCKO8UxjqcJbrUmh6671q1h9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a7opEU62; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a7opEU62"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC9780AB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 05:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwrLYHc_P9Np for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 05:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E57B380AB3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E57B380AB3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=a7opEU62
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E57B380AB3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 05:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24CCA5C53FA;
	Thu, 12 Sep 2024 05:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54B9C4CEC3;
	Thu, 12 Sep 2024 05:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726117609;
	bh=PSBPRfpXCTFazNXYG5W2cn6TzhVgjMf+nyJ5Kwf2BV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7opEU627fSf6p/Dp4wCT3UqZKD4Oqa97nQxj+sRqTmijf2HMv2X5fTBy7Hqh0tiX
	 XF5+cEV34zubsNMI2Z7JyQwhUOZu0kz18YlT9t4oKhARbP+otA6ZoPXmk868EwFxST
	 vjnYXbvwGawdYUgDuxDr/WXOhliIvzu4ow8GQHEM=
Date: Thu, 12 Sep 2024 07:06:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <2024091228-bootie-name-4867@gregkh>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
 <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
 <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>
 <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>

On Thu, Sep 12, 2024 at 06:15:18AM +0530, Abhishek Tamboli wrote:
> Hi Alan,
> On Thu, Aug 01, 2024 at 10:51:35AM -0400, Alan Stern wrote:
> > On Thu, Aug 01, 2024 at 08:54:18AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > > 
> > > 
> > > On 31.07.24 20:19, Alan Stern wrote:
> > > > On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> > > > > On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> > > 
> > > Hi,
> > > 
> > > I should make my reasoning clearer.
> > > 
> > > > > > Replacing the variable with a constant won't make much difference.  The
> > > > > > compiler will realize that bl_len has a constant value and will generate
> > > > > > appropriate code anyway.  I think just changing the type is a fine fix.
> > > 
> > > While that is absolutely true, it kind of removes the reason for the patch
> > > in the first place. The code gcc generates is unlikely to be changed.
> > > 
> > > We are reacting to a warning an automatic tool generates. That is a good thing.
> > > We should have clean code. The question is how we react to such a report.
> > > It just seems to me that if we fix such a warning, the code should really be clean
> > > after that. Just doing the minimum that will make the checker shut up is
> > > no good.
> > 
> > With this fix, the code seems clean to me.  It may not be as short as 
> > possible, but it's clean.
> 
> I noticed that the patch has not yet been pulled into linux-next, 
> even though it has been acked-by you for over a month. Is there 
> anything else I need to do on my end?

Yes, please resend it, it is long gone from my review queue, sorry.

thanks,

greg k-h
