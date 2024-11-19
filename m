Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6891D12EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036143; cv=none; b=Ps1ni+MpeTXYVJZhpvQIX0fxAFbL20fkZZCY61DP2hxwlmuqAqsB6p6kUZOjEp/UuzAoQich4cULNQmUw3iVqE9EkgHWhegRuVsAlDZKjuJYopV5eZ8qNDTAedqpe58SfH6i4D9NCqos1bhX9BMK7L/UClmX2WglVNYtuibcRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036143; c=relaxed/simple;
	bh=jsziOO9YUbowy87BvWTnC8X1lFfY8X8yPem1cuFkzzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/yLsoS92cpo+ORPjXkQswMb0nuzPv/A7QQ0yeJVJr1LOY9W7sfjoZTQuV430zrgKNSI7iG9aQOJUU03YrbCXKgeHb7suqhQosIL/Itn8R9pbIjRoCCs82r9R6+wBY5il8w+NiCLu+XCupjv4+oV7PSC6kPQKbHqO9/Cbk9xLX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JGfLtTPI; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JGfLtTPI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC4B42E38
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 17:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jRnkvI1Dx7Pg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Nov 2024 17:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 960D742E64
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 960D742E64
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JGfLtTPI
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 960D742E64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Nov 2024 17:09:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A754A42C9A;
	Tue, 19 Nov 2024 17:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638C0C4CECF;
	Tue, 19 Nov 2024 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732036138;
	bh=jsziOO9YUbowy87BvWTnC8X1lFfY8X8yPem1cuFkzzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGfLtTPIqzcit5VvNsJUVfT/vg9o1LawHE22rSxWK1UcM4MGyOP5a7izMSURy7+VN
	 tWH0YXo08kIUIJgbgfhcPuEreJVJwaR6gSgYEyTiUL9dDj5W6Mmb9fEgp/x7zt1xTR
	 pM3W6BtNqQFTCnfEhxyB1BiDdgHf8e9HOcekMV1s=
Date: Tue, 19 Nov 2024 18:08:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, skhan@linuxfoundation.org,
	ricardo@marliere.net, linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: usb: dwc3: remove deprecated member
Message-ID: <2024111922-pantyhose-panorama-6f16@gregkh>
References: <20241119154309.98747-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119154309.98747-1-luis.hernandez093@gmail.com>

On Tue, Nov 19, 2024 at 10:43:07AM -0500, Luis Felipe Hernandez wrote:
> This patch updates the documentation for the dwc3_request struct,
> removing the sg (scatter list pointer) member.
> 
> - Remove 'sg' in the doc block for dwc3_request
> 
> This change resolves a documentation warning related to the missing
> description for this field.
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
> v1->v2: remove unused sg struct member as per review[1]
> [1] https://lore.kernel.org/linux-usb/20241119020807.cn7ugxnhbkqwrr2b@synopsys.com/#t
> ---
>  drivers/usb/dwc3/core.h | 1 -
>  1 file changed, 1 deletion(-)

What about the "Reported-by:" tag?

thanks,

greg k-h
