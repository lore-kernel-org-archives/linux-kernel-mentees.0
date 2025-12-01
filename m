Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31029E11A
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764573789; cv=none; b=KoWEcmj3mtEIZHWPH+zw/ZjknqHmbHJrZQPbXj6qZYCK6EkW4z+RGQkDiN5hmg42yyrrrgqNSUga/7N4oofpr0uJEZ9E0Ue/qoKM0bxs7KQrpfVP+em3pNTqvcUhXn94n0LMwwM1bq6gVJGs0sAyLM/UNhkayK5ESY0qcVfvWRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764573789; c=relaxed/simple;
	bh=Yy8/JJenWxU8bQlYEdVlwLq4cA5tqo17rndP0DhLawI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yzwp5uF7eOkx+KZwDo2ZHfsgznYoaJPnBQdJJob7tWOi7BdF9VjxWqCDBxLO7ic5XgW/ToKvW2WsI9MB1maDwFevG9KwL/4D9hKQojTvN5KCq6VqF885h34AwNpQoCT/uP1anpgN/m1HHgb9V41cMwXUSqmgN4Ch7YHT8aQCwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkj2lXkU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkj2lXkU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297ec50477aso15430135ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Nov 2025 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764573787; x=1765178587; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nsPYaeG9WOKt7UvSBlmL6x58HE75ArQ750F87XhjNTU=;
        b=Xkj2lXkUNBP1K9AqZX7MDlMs5/5U3GIey41lyF8TmabRmncYXd9f3lZGlE7aBG14TU
         qHBrNbdfhZDxT7CEjZsN6wRk744VSdOpoS545BD1SaZR+j1QQgyLYjgDw1z8xVEYDNIs
         EVEnAxqT5ZRYUnHXGiKZ8Fld2AdWLI4m7pX+qXY3mtohdXDrnKLVif4XkBRgoW2elIyw
         A6A0a4s3ir8reAlKFliQAGOf5+U9KYv0Ecra+ZrhsIJ6U2FpSTcz9dAvgu8/betEd+uJ
         G9VdChnt+jUx9NVWwK/mkYumqm+p9jh78Z/PVpJfIrKNnL8wB/1N6Pc+HolNLQclJCHt
         Hs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764573787; x=1765178587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsPYaeG9WOKt7UvSBlmL6x58HE75ArQ750F87XhjNTU=;
        b=aW1xvqF3QKvtCE6Ji0+c8QCKkJo9j+lUtSTcEf8Jkq2zSU+OPyB1qxYaUzMvdMsdjb
         nGSNxAC2LKmpq86sD0lMAmxDNi4jeEC0tkIrOVHtqY7MOq7nAYsp5y+7oqMjGDg5vKUD
         qX+a9b/gH6UFx2cHetv0ysm26TGe17lglAnkjIahjtRlMJClzgaXvZDZhL885hpkWU+q
         czKEboU0O1ftR/JnvMUa16Z9HFEW2O/7b3Rv3JuOYVT9I3RK+nvRsFCMX1F9VfF1D6oW
         z9Er8IH9qVBFzLL1W5X+5r4Z2MRZB4eu9S62WFUwoA3It96Ww8vTQro0tpGbwjZJxVG4
         dZGg==
X-Forwarded-Encrypted: i=1; AJvYcCXABdkPO3byIUsqRuYCFy8o5Ls/vcyGDEziLAXySusSR81OPMIliCBCx6XQbsyvUe+PGhPzfaDIx+SS+F5iNL/R6rP+Bw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMiLd42iYRI3AoIbVEjHfZbIvBEQ0OrBP3rV6kF38lK4t6Z/Ct
	x9v7J5M2Fzzezl2zHOtW5PaH4Elok6V4v2YBRUG4iXeu3t7WdqCLa96g
X-Gm-Gg: ASbGncsTKHszbSq29RZqt6yGG0CNnelDdxKZLCqSghIgfR1xNKni4A+Tt8ZkKCqm3pp
	U/vXVzn3JKVi+62jFdcQXql/k9ls97UEFVh8Rp0YJ3bVaaEUrjRPmFiTI+nfNmLFUhDMPe4xd5y
	f7q7SjnmzT+mWZOFFYJx36PlYmjX7+YE/86yYU8hE4USgjeGx9vRUZoZgVeEbZ85T5hUAZrDTKR
	ANzDcu1DZGVNjatBxqiqRA55rvieIcb+krWB4ooOA/ewO3XPQbaSyMZaVPvU8B+JSEtH25+Z8xX
	u51uVPwyg5d9u5DaIgpR3sXLH7UmxJCMa9lC8tAsQdUvcnG+8K0lvtHMWlpbg3SwPYU40hqpdBb
	am/rHqY/y8QPnPwjzq1qdPK8pmyL1H9UtnFP2HCSfPew4d7TO0KEcpvYF46MUx8fAgMATcxzsc7
	7HyYsJiGrvHg==
X-Google-Smtp-Source: AGHT+IExHacmoOjLqpowlH+xbLwZ/5a1cHySOLNyr8/GIiYEg8delrkvbo/escNwn50cTcedfAQDrw==
X-Received: by 2002:a17:902:cf41:b0:296:547a:4bf2 with SMTP id d9443c01a7336-29b6c004ae1mr381601045ad.27.1764573787245;
        Sun, 30 Nov 2025 23:23:07 -0800 (PST)
Received: from inspiron ([114.79.136.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb2765esm113452535ad.65.2025.11.30.23.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 23:23:06 -0800 (PST)
Date: Mon, 1 Dec 2025 12:52:59 +0530
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
Subject: Re: [PATCH] fs: ocfs2: fix kernel BUG in ocfs2_find_victim_chain
Message-ID: <aS1CU5ISRK8yTfpA@inspiron>
References: <20251130104637.264258-1-activprithvi@gmail.com>
 <6d27a5aa-1e32-4dd3-997c-ddc015be88a3@linux.alibaba.com>
 <aS00nMK1juomYZkN@inspiron>
 <95804297-3a21-4024-8eb0-e75e8a3c4f87@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95804297-3a21-4024-8eb0-e75e8a3c4f87@linux.alibaba.com>

On Mon, Dec 01, 2025 at 03:07:56PM +0800, Joseph Qi wrote:
>
>
>On 2025/12/1 14:24, Prithvi Tambewagh wrote:
>> On Mon, Dec 01, 2025 at 10:51:49AM +0800, Joseph Qi wrote:
>>>
>>>
>>> On 2025/11/30 18:46, Prithvi Tambewagh wrote:
>>>> syzbot reported a kernel BUG in ocfs2_find_victim_chain() because the
>>>> `cl_next_free_rec` field of the allocation chain list is 0, triggring the
>>>> BUG_ON(!cl->cl_next_free_rec) condition and panicking the kernel.
>>>>
>>>> To fix this, `cl_next_free_rec` is checked inside the caller of
>>>> ocfs2_find_victim_chain() i.e. ocfs2_claim_suballoc_bits() and if it is
>>>> equal to 0, ocfs2_error() is called, to log the corruption and force the
>>>> filesystem into read-only mode, to prevent further damage.
>>>>
>>>> Reported-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
>>>> Closes: https://syzkaller.appspot.com/bug?extid=96d38c6e1655c1420a72
>>>> Tested-by: syzbot+96d38c6e1655c1420a72@syzkaller.appspotmail.com
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
>>>> ---
>>>>  fs/ocfs2/suballoc.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
>>>> index 6ac4dcd54588..84bb2d11c2aa 100644
>>>> --- a/fs/ocfs2/suballoc.c
>>>> +++ b/fs/ocfs2/suballoc.c
>>>> @@ -1993,6 +1993,13 @@ static int ocfs2_claim_suballoc_bits(struct ocfs2_alloc_context *ac,
>>>>
>>>>      cl = (struct ocfs2_chain_list *) &fe->id2.i_chain;
>>>>
>>>
>>> This blank line can be eliminated.
>>>
>>>> +    if (le16_to_cpu(cl->cl_next_free_rec) == 0) {
>>>
>>> Better to add the upper limit check as well. e.g.
>>>
>>> !le16_to_cpu(cl->cl_next_free_rec) ||
>>> le16_to_cpu(cl->cl_next_free_rec) > le16_to_cpu(cl->cl_count)
>>
>> Hello Joseph,
>>
>> I went through the code in fs/ocfs2/suballoc.c, like this function
>> static inline u16 ocfs2_find_smallest_chain(struct ocfs2_chain_list *cl)
>> {
>>     u16 curr, best;
>>
>>     best = curr = 0;
>>     while (curr < le16_to_cpu(cl->cl_count)) {
>>         if (le32_to_cpu(cl->cl_recs[best].c_total) >
>>             le32_to_cpu(cl->cl_recs[curr].c_total))
>>             best = curr;
>>         curr++;
>>     }
>>     return best;
>> }
>>
>> and in function ocfs2_block_group_alloc() these lines
>> if (le16_to_cpu(cl->cl_next_free_rec) < le16_to_cpu(cl->cl_count))
>>     le16_add_cpu(&cl->cl_next_free_rec, 1);
>>
>After this, cl_next_free_rec may equal to cl_count.
>
>
>> and observed that according to the architecture of ocfs2, the chain list is in the form of 0-indexed array. In that case, the change you suggested for upper limit, could be re-written as
>> le16_to_cpu(cl->cl_next_free_rec) >= le16_to_cpu(cl->cl_count)
>>
>> since value of cl->cl_next_free_rec greater than or equal to cl->cl_count will indicate that there are no available chains. Can you please review this?
>>
>Yes, it's full. But 'cl_next_free_rec == cl_count' is a designed behavior, see mkfs or fsck.

I get it. We are trying to catch a state of disk corruption, so your 
suggestion

le16_to_cpu(cl->cl_next_free_rec) > le16_to_cpu(cl->cl_count)

fits best here. Thanks...I will make v2 for the patch.

Best Reards,
Prithvi

>
>Joseph
>
