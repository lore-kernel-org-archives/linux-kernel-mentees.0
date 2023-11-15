Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net [178.33.251.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A520B37
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.156.25])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id C30FE28A8F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 16:05:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k8mr2 (unknown [10.108.4.159])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D06841FE53;
	Wed, 15 Nov 2023 16:05:31 +0000 (UTC)
Received: from RCM-web2.webmail.mail.ovh.net ([176.31.232.109])
	by ghost-submission-6684bf9d7b-k8mr2 with ESMTPSA
	id ayhHFUvsVGXUOSsAdDy9bg
	(envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 15 Nov 2023 16:05:31 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 18:05:30 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, skhan@linuxfoundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev,
 syzbot+89edd67979b52675ddec@syzkaller.appspotmail.com, Hugh Dickins
 <hughd@google.com>
Subject: Re: [PATCH] mm/pgtable: return null if no ptl in
 __pte_offset_map_lock
In-Reply-To: <ZVTTbuviH9/RWYyI@casper.infradead.org>
References: <20231115065506.19780-1-jose.pekkarinen@foxhound.fi>
 <ZVTTbuviH9/RWYyI@casper.infradead.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <1c4cb1959829ecf4f0c59691d833618c@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.100.249
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17026984294489761383
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefiedgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudekhedrvddvtddruddttddrvdegledpudejiedrfedurddvfedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdguvghvpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth

On 2023-11-15 16:19, Matthew Wilcox wrote:
> On Wed, Nov 15, 2023 at 08:55:05AM +0200, José Pekkarinen wrote:
>> Documentation of __pte_offset_map_lock suggest there is situations 
>> where
> 
> You should have cc'd Hugh who changed all this code recently.

     Hi,

     Sorry, he seems to be missing if I run get_maintainer.pl:

$ ./scripts/get_maintainer.pl include/linux/mm.h
Andrew Morton <akpm@linux-foundation.org> (maintainer:MEMORY MANAGEMENT)
linux-mm@kvack.org (open list:MEMORY MANAGEMENT)
linux-kernel@vger.kernel.org (open list)

>> a pmd may not have a corresponding page table, in which case it should
>> return NULL without changing ptlp. Syzbot found its ways to produce a
>> NULL dereference in the function showing this case. This patch will
>> provide the exit path suggested if this unlikely situation turns up. 
>> The
>> output of the kasan null-ptr-report follows:
> 
> There's no need to include all this nonsense in the changelog.

     No problem, we can clean the patch if we find there is something
worth upstreaming.

>>  spin_lock include/linux/spinlock.h:351 [inline]
>>  __pte_offset_map_lock+0x154/0x360 mm/pgtable-generic.c:373
>>  pte_offset_map_lock include/linux/mm.h:2939 [inline]
>>  filemap_map_pages+0x698/0x11f0 mm/filemap.c:3582
> 
> This was the only interesting part.
> 
>> +++ b/include/linux/mm.h
>> @@ -2854,7 +2854,7 @@ void ptlock_free(struct ptdesc *ptdesc);
>> 
>>  static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>>  {
>> -	return ptdesc->ptl;
>> +	return (likely(ptdesc)) ? ptdesc->ptl : NULL;
>>  }
> 
> I don't think we should be changing ptlock_ptr().

     This is where the null ptr dereference originates, so the only
alternative I can think of is to protect the life cycle of the ptdesc
to prevent it to die between the pte check and the spin_unlock of
__pte_offset_map_lock. Would that work for you?

>> +++ b/mm/pgtable-generic.c
>> @@ -370,6 +370,8 @@ pte_t *__pte_offset_map_lock(struct mm_struct *mm, 
>> pmd_t *pmd,
>>  	if (unlikely(!pte))
>>  		return pte;
>>  	ptl = pte_lockptr(mm, &pmdval);
>> +	if (unlikely(!ptl))
>> +		return NULL;
>>  	spin_lock(ptl);
> 
> I don't understand how this could possibly solve the problem.  If 
> there's
> no PTE level, then __pte_offset_map() should return NULL and we'd 
> already
> return due to the check for !pte.

     I tested the syzbot reproducer in x86 and it doesn't produce this 
kasan
report anymore.

     José.
