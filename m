Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5729B8DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770060; cv=none; b=AgohuoeITix5UhPaD4tk7EgbyQhj9kVQJRoma4itQ9b/gDaBTLLJiBYz6IUBxa3z86dsqrhQ5/vFfGpEptjBQvdHVqurW2RmM8ksJ2bHdmF312M/24yW6WFCC3U7/s5bgDi0uvAKR46uj0FsCMQhcyzQaWUAUUl+A3R2gIV1h/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770060; c=relaxed/simple;
	bh=6F5BVpPIMSFDsl0J2EHPFaGWvbgltaB5Rv9+h6mywQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNoYopXyXZj1Z3UXKKEovaeSARV62PoBC96e/FRshiz8HGDKGf9jEUGUNpVIa/HmEpO2DNGFN5uHOAOmv5kWemU8uJQpXhd+U8nC9VURSibUEf3pmbuPdfOQS4okwM5HwyxVgrRX+YbbeoH+fJCds01LqloQaPTaqC4QQVhJEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=In01Ppld; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="In01Ppld"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0910408C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9d2izN-ZlbL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 16:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F4144051A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4144051A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=In01Ppld
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3F4144051A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:34:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF74A5C58B3;
	Thu, 17 Jul 2025 16:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFADC4CEE3;
	Thu, 17 Jul 2025 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752770056;
	bh=6F5BVpPIMSFDsl0J2EHPFaGWvbgltaB5Rv9+h6mywQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=In01PpldVREQFtAzVCfOdUOVullFaNrUs9KFxnhxK1Pji2n3qvDgoF2omz22irZhO
	 z9AiCvKsPc+Ny9R5UUbb6Dluw7tuekD5XcUUMAWNxC2+9iA7qh8efTHQ29JItsDGt1
	 F5IcDW55qL9xg3AoBOJVoRL1pptSiAErD9RIZN1w=
Date: Thu, 17 Jul 2025 18:34:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [ANNOUNCE] kernel-patch-validator - Tool to validate patches
 before submission
Message-ID: <2025071741-pregnant-punctured-f1fb@gregkh>
References: <ZppSfKGao4PQvRJd@kroah.com>
 <20250717162936.23035-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717162936.23035-1-ignacio.pena87@gmail.com>

On Thu, Jul 17, 2025 at 12:29:36PM -0400, Ignacio Peña wrote:
> Would you prefer if I start with small individual patches to checkpatch.pl
> for each check, or should I put together an RFC first to discuss which
> checks would be most valuable to integrate?

Just send patches, like normal.  "RFC" doesn't work for when you don't
have working patches to start with.

thanks,

greg k-h
