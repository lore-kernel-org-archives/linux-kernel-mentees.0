Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8EF1E5B94
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 05:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764568243; cv=none; b=PWVcRlwN/Pa1+I3tSzFqCNSFiymKNwlC5kYvB7NRyAQM0WA7RWQrPcMRY8zrdp/3jFhODmUbna+3T126AIRAZWX75im9OC3GDUl5/9Ip3IoJGQ3FgoAgsQRi2A3dMKIIoq7/QBlu8OM98YPrTLuyvFiWj0fJoaevfN+QXrZMMjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764568243; c=relaxed/simple;
	bh=F/ztnYndVtU2pe1Fg5UObZ2BY77hbdFGOdTO0oEiKWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPoQTNrQt9ftf5S/5N2wA05fzWj68Kr4n4cYP0wNRMYJJkvGvldmpz1UT4Abd9Zh5Cnz9VHMfk/BGWgcK0y/jV+ng5s17/R9wnlQ1rPo6OaTh+zyPxNFEkPgW4qRZD95KbjgIW0JxGyR2KfuIFxxlfd9xsDcuWQNBeD/XeCU/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXBWojhC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXBWojhC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29845b06dd2so51059945ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Nov 2025 21:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764568242; x=1765173042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJREozEjseeIu9xfaigiftxOhLedS8qLXirYP5CG/7w=;
        b=dXBWojhCIcvdqbkkO5F/95ZizRbXZdNCQIKS87/oSHCBuGpRiE950XoUfiGYvA1uiB
         E3omPbvYhBCAZ3FlLxdiNZZ2WkGis8FLS1dEpn6S+bzbLmqbEsdvP4QJQ8KIMfYAbzdh
         BQQwOzHEi1f3/U/7Jcza6rz6GDVpTA4wyvMj2poDEfKxQ9egtmnp3dw5LKgnD9itICuH
         Ze8rNcJl3m8JoGgK/CTA7s3zS2wejqf3iZubppNYdn4JBZg5KT70+eOAwJycwbpK/pCT
         HQfRACRZNtMnb2To9bdxWwb45Sx/3ZZvb2dAUbJ8TPSKMeu2BHnUhSNH3OuNusz/hLgo
         d9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764568242; x=1765173042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJREozEjseeIu9xfaigiftxOhLedS8qLXirYP5CG/7w=;
        b=l5xG34sFnmQV04Vb5KVKoyousUmGh2Hu2v1FOJG6McHX7qlHQzsRS6XPplPGAuGBZK
         XxAlJnO7e3DOtTdDN3gcu+LmCmkHNRDV3fFflyqbGmCiiBvq6F5WzMINcxpQPMIcf6p7
         ryT77CUFDTw4VqVL9Od+lUDo/xV+z5gjfop2DhERPrue2oeMInmO+/W89CmOxWc1Zqne
         EDH6i62ORxlqcbDf+CJSwmUDSPh5TmB09mEeY0OzSvmZmPdER8qr+4w1Zg1HFWolTnng
         SHrRqgwybPR9oP/5oFhK/t01ycsLlI7Z1z+I/w5CJA9FGlWNAnqZaM5g2HxCVW6mUMWn
         CVgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWhAA1eX2aFZ/YvkVsKLVtaKa2ehiuLKapQhoq9MxsIEJXQ7ShQvXnYgttotzSEBFFzrTpSWRAxWZ/H2QNj90ULCEWXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLOznTR7JCbMdrSCOkOYcj2vaKg4OGXEYao+GED/wDaiS3Jub5
	7p9ApUrWCnk3xCGvJHvSnF/MMbbin4Z4hcVBR7Rd+wZL8tl1oSkEqiCZ
X-Gm-Gg: ASbGncvakE8wbbosaz0cdw/4RYAga0MP/Mm4ZbDUAQt2u/DhHL3H5QvDNxc1gAeCBVC
	gyiQCQ5SGAVihJfgTXf5O3+09Gm5LK26FUcJ6QRdFo1a9VuG4lMVqROWhs8/jKtoulsL9hGCnPU
	XxejNNMN9pdb0wX7YXPTA+tfb8SGj56hYOYhQFO2qqbR1y/lW4fMRoISfC07AgEUuJ7lBuAtCJj
	W8ydEkiL1iWL0fXAqoJ8CU5K/rbSMElkcAFvEpzniY2P3Xsk/Vkz6sOqICc/FSt/ujBnbYHzxLN
	/IVMhb6jMXFDF/7MMQ2gqNJe84SxM1c4po2m7oUlqrGd2BKxosOQg4jY+1wy+qZV5S3CHvAdp1i
	8B9KNE4fB/LY+1COLmTTSb6+RHrI/UX0h+HuOJhTFZh8MrJXpstQBSuXDqQ5tHvdlkb/JIYOxCb
	KCTyXTcK1P/YL1ihyzVqMt
X-Google-Smtp-Source: AGHT+IFepUydC64DMkmBda+q1x8TpJ+ZVbr2aragVE01SyztePUbnC5ulz34kBE3htJbBIeaaym06g==
X-Received: by 2002:a17:902:e94d:b0:295:888e:9fff with SMTP id d9443c01a7336-29b6c3e921fmr421343225ad.20.1764568241595;
        Sun, 30 Nov 2025 21:50:41 -0800 (PST)
Received: from inspiron ([114.79.136.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb5dc73sm110259815ad.98.2025.11.30.21.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 21:50:41 -0800 (PST)
Date: Mon, 1 Dec 2025 11:20:34 +0530
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Subject: Re: [PATCH] fs: ocfs2: fix kernel BUG in ocfs2_find_victim_chain
Message-ID: <aS0sqmSpqWTi5T3v@inspiron>
References: <20251130104637.264258-1-activprithvi@gmail.com>
 <6d27a5aa-1e32-4dd3-997c-ddc015be88a3@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6d27a5aa-1e32-4dd3-997c-ddc015be88a3@linux.alibaba.com>

On Mon, Dec 01, 2025 at 10:51:49AM +0800, Joseph Qi wrote:
>
>
>On 2025/11/30 18:46, Prithvi Tambewagh wrote:
>> syzbot reported a kernel BUG in ocfs2_find_victim_chain() because the
>> `cl_next_free_rec` field of the allocation chain list is 0, triggring the
>> BUG_ON(!cl->cl_next_free_rec) condition and panicking the kernel.
>>
>> To fix this, `cl_next_free_rec` is checked inside the caller of
>> ocfs2_find_victim_chain() i.e. ocfs2_claim_suballoc_bits() and if it is
>> equal to 0, ocfs2_error() is called, to log the corruption and force the
>> filesystem into read-only mode, to prevent further damage.
>>
>> Reported-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=96d38c6e1655c1420a72
>> Tested-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
>> ---
>>  fs/ocfs2/suballoc.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
>> index 6ac4dcd54588..84bb2d11c2aa 100644
>> --- a/fs/ocfs2/suballoc.c
>> +++ b/fs/ocfs2/suballoc.c
>> @@ -1993,6 +1993,13 @@ static int ocfs2_claim_suballoc_bits(struct ocfs2_alloc_context *ac,
>>
>>  	cl = (struct ocfs2_chain_list *) &fe->id2.i_chain;
>>
>
>This blank line can be eliminated.
>
>> +	if (le16_to_cpu(cl->cl_next_free_rec) == 0) {
>
>Better to add the upper limit check as well. e.g.
>
>!le16_to_cpu(cl->cl_next_free_rec) ||
>le16_to_cpu(cl->cl_next_free_rec) > le16_to_cpu(cl->cl_count)
>
>Thanks,
>Joseph
>
>> +		status = ocfs2_error(ac->ac_inode->i_sb,
>> +				     "Chain allocator dinode %llu has 0 chains\n",
>> +				     (unsigned long long)le64_to_cpu(fe->i_blkno));
>> +		goto bail;
>> +	}
>> +
>>  	victim = ocfs2_find_victim_chain(cl);
>>  	ac->ac_chain = victim;
>>
>>
>> base-commit: 939f15e640f193616691d3bcde0089760e75b0d3
>

Hello Joseph,

Thanks for the feedback! I will make the changes in the patch. I wanted 
to confirm that the new patch should be sent as v2 on this same thread, 
along with the change log since v1, right?

Thanks,
Prithvi

