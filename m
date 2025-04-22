Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FB11EEA4B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Apr 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308714; cv=none; b=eZjzhMsY4wvLiydhFV1Xdcp7PSR+ZKgiSVk5BHr3j1rFSjpawi9A47s8Up8xgxYjBsYGHXXpiiqedO+13lQdnXSXAzLk9pZtxfnjHoBPzmmdgHwzd/AlyzX0CGEdPsHoeR93w9J1hZEoU0PSYl+DFWDe/NZBFHyTUykGbSjliNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308714; c=relaxed/simple;
	bh=4APg6yVz6kgCDi8Roxi56DKotyt2hsl1mO8Xu/bEAlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Je1tu5+iNiKUzZYfTcuClBESLgXr/pe7CXKy+x7VFIJi61xxQmMYCcWT9H9yEaM9VgYtJVSLop+eRzUz+eQok4qOVvTqF75LW5Zmb83m1Dev0kAuE+ihOmOfoT+oOoVShJPIGLPczNv0q3y1g/kWT8tistYU8yfrF7bVSSvQWzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE4581CD0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Apr 2025 07:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.591
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLhVQUBdeESk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Apr 2025 07:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84F1281BD9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lst.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84F1281BD9
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 84F1281BD9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Apr 2025 07:58:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C31F868AA6; Tue, 22 Apr 2025 09:58:26 +0200 (CEST)
Date: Tue, 22 Apr 2025 09:58:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: linux-nvme@lists.infradead.org, sagi@grimberg.me, kch@nvidia.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2] nvmet: replace strncpy with strscpy
Message-ID: <20250422075826.GB32494@lst.de>
References: <20250403232432.25255-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403232432.25255-1-marcelomoreira1905@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to nvme-6.16.

