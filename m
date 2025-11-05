Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE830F92D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341297; cv=none; b=JKBg+ipvN6Y5b3WridBdi0UEvk9ZTmm7e24nsidVZ7/BpK5J7+5kyRi1rbl9+m5UlfEmruSszEb94CtEgiMAuY89aM/lF6+nCbweVCuwvvOPg+Y2zmAwRQTaToFzUjASfzoPdtWLrJK33VwB+VNXDVujKr3RbEJx0DvMn0E4HCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341297; c=relaxed/simple;
	bh=Hr1qTb8xrcj/E/cr8cExwDIT7AhrOUIw7GHOKQAcWp0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hh2nKhuj1UBN/1QLHN3Bj67p/6/p2+yp0EZu+wu7csnlK35T97LVJw7iHgTnOFBgBW2eGXTjS9um8/Gjvg534zm+8ETg17TXqD5u8cHYkbe/E3RvpNR02CNWIc/W9gyI50157PMYt7qoaf00olcJO6ntiMAGkhfVC0DCNmudisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p29hFktc; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p29hFktc"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141556067A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSOccu96dMl4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 11:14:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5EDB4605F9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDB4605F9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p29hFktc
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5EDB4605F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:14:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57DB644752;
	Wed,  5 Nov 2025 11:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B78DC4CEF8;
	Wed,  5 Nov 2025 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762341294;
	bh=Hr1qTb8xrcj/E/cr8cExwDIT7AhrOUIw7GHOKQAcWp0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=p29hFktc6Y/DOjgHQGqLmyPglzmOJ5TqpoSQR3mwqzS0cbSSFfYb+xVRfubj1TTjP
	 641tsmlYpm5Mp9BRgHHse9AOewUIIRBRRE+7tYAllNbUEND2ebt9ZTIHf0ToUoO4bv
	 H/q3wc9seDlDK/bBB99enkqYv7kk3PU8tYHXHLKZYuz0z8WYPNBJNdw6eGFqhI72Hk
	 IGHPU+ITHU+GVJm+IxKeH/iiGI3tCEYH2JrXDUrU3USk0tkLF1rPDcXRE+FX1q7eXY
	 25f9EvEhyFfRu49GKOvtzH4fMVcg9uUF1oezsHldg+TEO35VwmedO3rxT2kQ8IGc0S
	 TqDWlDQhwskKw==
Message-ID: <96a9d740-5a96-4795-b69e-0cd0e165ad4a@kernel.org>
Date: Wed, 5 Nov 2025 19:14:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 stable@kernel.org, syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH v4 2/2] f2fs: Add sanity checks before unlinking and
 loading inodes
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1762339963.git.zlatistiv@gmail.com>
 <c56dfb1f6a27cd04a91d41a0448a26118c7cdc38.1762339963.git.zlatistiv@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <c56dfb1f6a27cd04a91d41a0448a26118c7cdc38.1762339963.git.zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/25 19:09, Nikola Z. Ivanov wrote:
> Add check for inode->i_nlink == 1 for directories during unlink,
> as their value is decremented twice, which can trigger a warning in
> drop_nlink. In such case mark the filesystem as corrupted and return
> from the function call with the relevant failure return value.
> 
> Additionally add the check for i_nlink == 1 in
> sanity_check_inode in order to detect on-disk corruption early.
> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
