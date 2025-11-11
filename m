Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588A33F8A9
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871978; cv=none; b=jpqJaa3NCtt3bmwtHHwBwHuen2gYy683lIbYUttV874BU4/3Fb+nDnKQepqlw9YkQ4Di/S73H0CobrwkgMROOebIz2dQNFHdQ1EKjlZU/7JN3BChJrZJ/ZxSn0607smAHZvKwgCEaqxMFSn2IHS9hFGs5d48bhkSmiaGBT5OU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871978; c=relaxed/simple;
	bh=NXqSvb17NNCUFpvhD7cqdSlUrGCN4ubhKTPQFX6Fflo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PY5WKczbCHjo/VxRquG2XRNhiG54ebcZG4MNAV4rBtWJxIydw29MWVc5SuQKwnWZByRNeN1MdqDbzhrB8Ing+jKLUVBboMwxwy6cyepZejo2MPb/xtXG25N4fqWwk5jOWUJsOyv0nqZIpH/cUo+nsfMkcGSw8WGczZVmnMrVNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5ABEdHtu056322;
	Tue, 11 Nov 2025 23:39:17 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5ABEdGNN056319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 11 Nov 2025 23:39:16 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <df9ed36b-ec8a-45e6-bff2-33a97ad3162c@I-love.SAKURA.ne.jp>
Date: Tue, 11 Nov 2025 23:39:14 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hfs: Validate CNIDs in hfs_read_inode
To: George Anthony Vernon <contact@gvernon.com>, slava@dubeyko.com,
        glaubitz@physik.fu-berlin.de, frank.li@vivo.com,
        linux-fsdevel@vger.kernel.org, skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
        syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com
References: <d2b28f73-49c8-4e30-9913-01702da4dfe4@I-love.SAKURA.ne.jp>
 <20251104014738.131872-3-contact@gvernon.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20251104014738.131872-3-contact@gvernon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/11/04 10:47, George Anthony Vernon wrote:
> +	if (!is_valid_cnid(inode->i_ino,
> +			   S_ISDIR(inode->i_mode) ? HFS_CDR_DIR : HFS_CDR_FIL))
> +		BUG();

Is it guaranteed that hfs_write_inode() and make_bad_inode() never run in parallel?
If no, this check is racy because make_bad_inode() makes S_ISDIR(inode->i_mode) == false.

