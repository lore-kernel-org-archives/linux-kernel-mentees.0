Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382CA277CBF
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570278; cv=none; b=rfJWmVs6m+SyrwS4ygus9u1ymSW/qn2cmfR95gWpNJPVGgVKqcuFhzc5a1vep4ySpy4e2rGHlWE/0nb/qiuNAvtHXZ2iEPmVwWI9xOra04tx5dfCqNPba2KRGwYxsKf+fZ5lI6GC1On4wKAQw3vE1JdHljVNvJJa9mUiK7XCAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570278; c=relaxed/simple;
	bh=2io+coGsPXy7Rc27r/JqPO/Zr9vIFhBw2CPH38P9x0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejX8nLiiBeVAGku7co7qmdbcL5MhaG+zi5C7X7oKxCjYAVV3mEk2H255ha1M2j1SVRcjcRytlg05KBa9jouAG/PEmHcd1ApiHuJzS6CeiPd4Ktk9uxzGOIf0oWUDvF6m06aRI5aQh8i+7liv+dQMXMI5YoxRgtZIRofyKrl5xrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHORUXbe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHORUXbe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34381ec9197so3214095a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Nov 2025 22:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764570276; x=1765175076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=peAT0TtJ+zmGu6HEzqEiByNE29w1TbiVx2+7wH8lyF8=;
        b=AHORUXbe82ZSY0coQu7vt58t/G113W9/C6fX9T8vo4/2RVE60cMQv5p4oDDrA8IguF
         XpknfKq/xlg1KiVs0UjfbTHZbJU3cpRj4W2FCSNExPC5vXysCF/nwbKJqlk7j1l7Py7m
         XKMCmgh196GpfEhiOM3Hhuan55VKx2xGjjdpDj0scNvyI9yBRaKKM7UQFBLrtAOTwkzI
         TFbyj29ITLySsGWh4pC/K1zN3ciyzIKsyi5dukmdnsImSBrqOa+KQmYNAC12pv0KC2es
         EJ2KBYxvaIpG205zqwME1HArQEotQncupX1IEfo8n0JIxVV5oQ+Fm4TxW+zB24i08yec
         9mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764570276; x=1765175076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peAT0TtJ+zmGu6HEzqEiByNE29w1TbiVx2+7wH8lyF8=;
        b=b2ekRyGwzLCC7TkHuWamwp4Fl4T93JgbgE9gvzknqDBRtnTckzHpzK56Hf5GDx/qEg
         0sReW+IvaYXeYeBo2mO8da+hkrLZcOA5xIxl9zZtb/6n6X4r4qDKMzttt48GGMr0nylM
         xzPuFmfEyS7W8VNx88MmEGBmyk3P1avU5kr6pc+KtqYkd7PPr7SZIn/Xv7pxDO6j4Ghr
         shjxAKUXH4/8jAiylzIO6yfBTEhjvC2A07CCTbQ6nwthaG1ZgYgHxKZvRM49pcvW13Yu
         MEs5uGqU8ShmHMYTULQXcXOJrOD37zsKVswuIzcpKEjr4bTGzPj73gjLHy5bYp9at9h3
         jBqg==
X-Forwarded-Encrypted: i=1; AJvYcCUKJeqt9gM3Q4KPqcycUx97KwINJ3PbkWd2pOkI5jO9ZLdRjCx7bdiEnkJjQzlLobgCeOkBZfUlU7pOpWKpl2tWwZO7vQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytVx6mGL0qIiOZ+mgE/HM+u/CGA5h96L+OjTcvBdVN1uR+EtIK
	NvtMxi+ueDtQ5QIxzQ9koPTIjivF1Fj2A6b3jI3+DOPT+hptOduSjYYB
X-Gm-Gg: ASbGnct1WMHq5EfsF2anuc3TuZtWRdFFvSG+r2qlpt39Mr9BubUZvU3qQrFcHu0tr4T
	/gIYYWsQGGx5+w8UzmsXGNfxbIWPXAzQqI4XUepWfR2KshZibxEG+46EpWE2NhSz/UefAvWNaVD
	vDa8HOZFu9xmVj+6HsE12/qHdMDHcVCJxdCFRJ5APdBqbKv8tnVjee5QzQejn9jVeufo4eRYrLf
	KOJtqbkFVv0P/Dh8hvbBDwIRJGy572MubQY77ZR1PmKkGuLvu4oBnqmloKIGaRzBDv7D6ymQCej
	Gf3d2S+MzlWR5j0/seOjeTQfGUhiIvej9HSdwMLmOREvuCOep9HaQxJUvG/zYl/c03UxacmoJD5
	KndpL5ms9zMKPf8OYdTRNQ5dd35KSDIPyC6qGLMnT+N3VDjPjiz1XhIhlg53c7AGDn/5teudwpI
	eZJZQGGzIxug==
X-Google-Smtp-Source: AGHT+IGNMBL8zDhRobd+qHrdQkwX8FWvtMRKN8hXCxfnIN+ugTut4kAT7vSMmoOejqWih8bkdISh2A==
X-Received: by 2002:a17:90b:4a08:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-34733e72342mr39442424a91.12.1764570276389;
        Sun, 30 Nov 2025 22:24:36 -0800 (PST)
Received: from inspiron ([114.79.136.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm11828072a91.11.2025.11.30.22.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 22:24:36 -0800 (PST)
Date: Mon, 1 Dec 2025 11:54:28 +0530
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Subject: Re: [PATCH] fs: ocfs2: fix kernel BUG in ocfs2_find_victim_chain
Message-ID: <aS00nMK1juomYZkN@inspiron>
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

Hello Joseph,

I went through the code in fs/ocfs2/suballoc.c, like this function 

static inline u16 ocfs2_find_smallest_chain(struct ocfs2_chain_list *cl)
{
	u16 curr, best;

	best = curr = 0;
	while (curr < le16_to_cpu(cl->cl_count)) {
		if (le32_to_cpu(cl->cl_recs[best].c_total) >
		    le32_to_cpu(cl->cl_recs[curr].c_total))
			best = curr;
		curr++;
	}
	return best;
}

and in function ocfs2_block_group_alloc() these lines 

if (le16_to_cpu(cl->cl_next_free_rec) < le16_to_cpu(cl->cl_count))
	le16_add_cpu(&cl->cl_next_free_rec, 1);

and observed that according to the architecture of ocfs2, the chain list is 
in the form of 0-indexed array. In that case, the change you suggested for 
upper limit, could be re-written as 

le16_to_cpu(cl->cl_next_free_rec) >= le16_to_cpu(cl->cl_count)

since value of cl->cl_next_free_rec greater than or equal to cl->cl_count 
will indicate that there are no available chains. Can you please review this?

Thank you,
Prithvi

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
