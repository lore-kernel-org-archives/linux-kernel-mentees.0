Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A1175AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jul 2024 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720937805; cv=none; b=XVnIjq49YqwaMtW34HFf6VZb87NzM39auiJPNFLQM0jB10+gADklG8N+PUeQLcgGkJedzWd0Wf07VhBVvjbpsV9eesR7k3panukBUs+CUCTnudQGdUcET8BuCrXKAceZTSrw8p7oIkedcCOtmsjfwExFbtUvxF0hJwN+MwAv6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720937805; c=relaxed/simple;
	bh=Rfbcaj32eY3615/cuJlKE/JNFiyObDcg0NOtD3Oyj4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Otpay5zwcqIOv+aAU+AtDCtcFm+0NXV7inuhdddK2joGR7WembBLFyri1+H1Cp59liR7WKHhmfln4I7Wtz9ZDXPH2A65HBkaH3kiQlVmbJfNtrF90VG1jsABLKTBVQjGyMk006ilkXKnEAGB9SU3N/2D1AHHtztUF/StZd8nmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T3B7uTa5; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T3B7uTa5"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E84E840236
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jul 2024 06:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cw0x_2GBmkeK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jul 2024 06:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1F23401B2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F23401B2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=T3B7uTa5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A1F23401B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 14 Jul 2024 06:16:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8110060906;
	Sun, 14 Jul 2024 06:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC38C116B1;
	Sun, 14 Jul 2024 06:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720937800;
	bh=Rfbcaj32eY3615/cuJlKE/JNFiyObDcg0NOtD3Oyj4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3B7uTa5zni6A+GI1W7yd+ppIhuPSI8gWAi8WnBcdoqeTHCxhBobT4WhltSSunGI7
	 jcOaztmPY5AMpLOlb/jB5TfCssZBMEz66OhqVyCpyyutgYsCRkb4U67IpuxPKXSR5G
	 CrEGHf6c1mKEKvZf8MJ6CNkxSNp/BLXP1IbERtB8=
Date: Sun, 14 Jul 2024 08:16:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@samsung.com,
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	andrewjballance@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, mcgrof@kernel.org, ojeda@kernel.org,
	russ.weight@linux.dev, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org, wedsonaf@gmail.com
Subject: Re: [PATCH v2] rust: firmware: fix invalid rustdoc link
Message-ID: <2024071418-precook-catatonic-587a@gregkh>
References: <CANiq72=6LSGwRsc+deE+U8H=mdgFisrKEPOYgVkZfHhGm8hwog@mail.gmail.com>
 <20240709004426.44854-1-andrewjballance@gmail.com>
 <ZpKUEKHh6gK7SODR@pollux.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpKUEKHh6gK7SODR@pollux.localdomain>

On Sat, Jul 13, 2024 at 04:49:52PM +0200, Danilo Krummrich wrote:
> Hi Greg,
> 
> On Mon, Jul 08, 2024 at 07:44:26PM -0500, Andrew Ballance wrote:
> > remove an extra quote from the doc comment so that rustdoc
> > no longer genertes a link to a nonexistent file.
> > 
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Fixes: de6582833db0 ("rust: add firmware abstractions")
> 
> Can you please pick this one up?

Will do after -rc1 is out, sorry, my trees are closed now for the merge
window.

greg k-h
