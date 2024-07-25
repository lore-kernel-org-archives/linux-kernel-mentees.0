Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E718028
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721922914; cv=none; b=bkA/tU8/qJfZBNc4K4AO0AYFn5nFW7eCOI2jGfkn3slaMBenlRZws7pdoDqrNww6ZNVwJQXK5bUKtkYPri2VsvlKCcI7iz1lRive3083898Un/jCEdHTwyj7Btq55mYsxGR/1DxrMBq5VfZQwAw/2In92nt7g91cbxISJJlxGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721922914; c=relaxed/simple;
	bh=LsPqL4zy5kIMEfBnKmaPvJEYRR+Qa9FcTb6inJQF+/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzlZRABYRKyi7dUpqN3M014Ui/yu9ZSWqhbKLmBC38CfAD+ZVpJvU/CEPFysdCDQp3nXSHcKB8f+P7WGiyhY+3xi9WJ5gAVPpVNfngP9wtHFrX2hY6qFcPcp3Une6+PRGPNolTt7NugxaCOZbi2hBz7cc+9brYCnZiJ5MpJKF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Aw1yVEd/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Aw1yVEd/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471318058D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 15:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yD569JaifuFY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 15:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0969781E8F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0969781E8F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Aw1yVEd/
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0969781E8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 15:55:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E7ECCE0AFD;
	Thu, 25 Jul 2024 15:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFD4C116B1;
	Thu, 25 Jul 2024 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721922908;
	bh=LsPqL4zy5kIMEfBnKmaPvJEYRR+Qa9FcTb6inJQF+/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aw1yVEd/GccN/vJ8oxuJCuYC2U/QjlmZATy0jmgOY24L+tEgDVGDTSjSuA82hmi38
	 94KTxHT7mC8/DE+3IUcQr93AI/L9jiPOQBwZPp1UdVoq2ZZtrx+86x+hSs9Tpj+hvc
	 OAzOPh/bKMc4eBzv+YBq5zdb9oKKO1+z/WWXGVAQ=
Date: Thu, 25 Jul 2024 17:55:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	Jan Kara <jack@suse.cz>,
	syzbot+600a32676df180ebc4af@syzkaller.appspotmail.com
Subject: Re: [PATCH 6.1.y] udf: Convert udf_mkdir() to new directory
 iteration code
Message-ID: <2024072549-difficult-predator-b7cb@gregkh>
References: <20240725135313.155137-1-sergio.collado@gmail.com>
 <2024072521-ducky-record-3b13@gregkh>
 <CAA76j93yfR7Z=g+uEk4OV6N3FqXS5XUXUw9DOKLbJ-yBP1MHVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA76j93yfR7Z=g+uEk4OV6N3FqXS5XUXUw9DOKLbJ-yBP1MHVw@mail.gmail.com>

On Thu, Jul 25, 2024 at 05:45:38PM +0200, Sergio González Collado wrote:
> Hello,
> 
>  Thanks for your feedback. Honestly it was a clean cherry-pick. I'm
> not aware I have changed anything ... but I can be mistaken.
>  I checked with the original commit, and the changes seem the same to
> me, although the changes are not in the same line numbers.
>  Is that change in the line numbers what you mean?

Do a clean cherry-pick and try to build the result, your patch was
different...

thanks,

greg k-h
