Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80201219EB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752750634; cv=none; b=jE6LSIwXLv1PFcETE86o2jP9oYElCFiUayyOkSidOt66ilc13vw96pTGnV6obfzvxvkO0idfHB5FpBSuxHliGqsREAX9OJqCqhS0uTAScTEiV8MFwEKtipXePfMtK0cL8EbhAZ9L9j4suGTo8xXQIKvgqb4w38f5/1sAbODZ/Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752750634; c=relaxed/simple;
	bh=o9DguUFd9ulRr/nGZ83LjaBmOxL8fPbmtWacXgwjtWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMl8v2u2z8vOgQElte1fFKFoYPzVHcNKb2VUbuDb5PFNZKl7LngBGvleYhq4yG5b/2Bo13onSh77twD8+dH9u76fdKTY1inB37iEam50+WU87EhlVcZh8NZvcfH3h5Sf+GQhp1TuGjk86FxAbkVNID0U0XtfMawR0YP1KZHwE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=faZP6oRv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faZP6oRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752750631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mcuwFP2i4FlUn9FFKBy/90wO5gqfwimly/CV8vM4gi8=;
	b=faZP6oRvZllCHZ2BIyg9npqUkUKxbYXyU2EMHfW4XfV3o3wYGfRyc87mv9BdcPUrsR0N8z
	YfCErjllDb4c4AL+ewFJZO7EF2HW+3ObRFCIsNN6Y2rya9k8Q3eumT3XFwHjHjaL6ra/Gm
	8I1An+c9d3+m3FAU2zbYRG8FTqd/yy4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-M1NJLxxdOUuosm27QR9ldQ-1; Thu, 17 Jul 2025 07:10:30 -0400
X-MC-Unique: M1NJLxxdOUuosm27QR9ldQ-1
X-Mimecast-MFC-AGG-ID: M1NJLxxdOUuosm27QR9ldQ_1752750629
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-455ea9cb0beso6966585e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 04:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752750629; x=1753355429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcuwFP2i4FlUn9FFKBy/90wO5gqfwimly/CV8vM4gi8=;
        b=T751Z8iUMDyysG/SGMRAlcvujZnfFGQ2Cen1xGmnrQVcu6FEnI2Aj/ihkFcykYvrN1
         /Yi2l940ZkXJN/qjLgg8qFOhIHvxax8cUHVdnU8tMNm3PTiaAOAF2BIrt6V5KdNQ/71s
         nflfPj2lZuQmaGB8Ex2mEyQys67lxvIyQDdQVutSjZnzWCY5QsjkUyTkSIDjsKj6pDMG
         W/DVG3Rvd4Bu71YDKIKWDknamRGFA+59lHUs+jrG4b42ZvzRZDF8tSUVORI0tOJrib4k
         SIDopOplnGB05KOza9I0/SI79oTODsff6C4u7QDr4rntx6H7WEaBFoZ4OOjEAxgIJq6c
         Zx1A==
X-Forwarded-Encrypted: i=1; AJvYcCXWDUZqCKamoIcrO7nA8xo7zA6nNv4N1YTZ7ovUBR9yg+0Xh4VyawJwFRo8uuMHei1ST656sUQFGgRL2QIZSYcfLb3xdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLgRS751dMfa7qz4IuUOShzTWv6MAjHKBSHNJQn3Sb5yFJgcs8
	G4K/u+9tJupQvPqZL5B1LJV7JzQoWGTxZ+TExE2seWtIDJE1sD1XWlqOBeyIsig7y3grilsRWLQ
	Zxzlg6I0sh1aN7gwxBC0ryf/b7MponqdHVS4Eozy75grE2ETxQNKdT2t+nltQcUHkIRdZHVsihy
	XT
X-Gm-Gg: ASbGncvdl5dl5AsCUY17I/2mqpfd9RwACW3TCbriYYW3YlSUenFMUuojRTmNxqrVTTP
	AnHi6v3Z/ctjw1bLTsmk0B4R3L1/uGJbLt1KY4QknfiLGKO2/KDG27JsVuGze/IE6x9hgkEqQ02
	FQA1EL0Y7Im1ZD7yyCgc/ZhbbL2xL5qb5xRAe72KYbQMUDHD/7jLrZk5dOA5yBGepDphD2JNzST
	kYtVN9loaelMdqAMl1o1GthP/ipB3w8x4THh+7YE0HwsBvckJWjn9wCa5e6Zj9Q9cSj5qIy7aAm
	8TUFAdsdU65ElOlTcJkdaJqnZpANbsdy7ndPufEnXaYxOkVoSv+CrRSTmRoJTjjo/U79gfGTItN
	C2hq1Wwuc0So=
X-Received: by 2002:a05:600c:3b11:b0:456:1dd9:943 with SMTP id 5b1f17b1804b1-4562e364923mr61991255e9.3.1752750628844;
        Thu, 17 Jul 2025 04:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxXKe1dFz2jXXAF/w6N+sF1RD95sU2Z+R0uSK0mMsz4eDz0ygxowQ/EwGBBRV415p8rq+tCA==
X-Received: by 2002:a05:600c:3b11:b0:456:1dd9:943 with SMTP id 5b1f17b1804b1-4562e364923mr61990895e9.3.1752750628413;
        Thu, 17 Jul 2025 04:10:28 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627898725sm53301605e9.1.2025.07.17.04.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 04:10:27 -0700 (PDT)
Message-ID: <0f6e9770-1c79-418e-9135-df692f495a91@redhat.com>
Date: Thu, 17 Jul 2025 13:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: skmsg: fix NULL pointer dereference in
 sk_msg_recvmsg()
To: Pranav Tyagi <pranav.tyagi03@gmail.com>, john.fastabend@gmail.com,
 jakub@cloudflare.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, ast@kernel.org, cong.wang@bytedance.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 syzbot+b18872ea9631b5dcef3b@syzkaller.appspotmail.com
References: <20250715081158.7651-1-pranav.tyagi03@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250715081158.7651-1-pranav.tyagi03@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rE15kx06upRSR_reKeerxMy1FS_qHPGwaAs-mprtjhM_1752750629
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/25 10:11 AM, Pranav Tyagi wrote:
> A NULL page from sg_page() in sk_msg_recvmsg() can reach
> __kmap_local_page_prot() and crash the kernel. Add a check for the page
> before calling copy_page_to_iter() and fail early with -EFAULT to
> prevent the crash.

Interesting. I thought the sge in this case are build from the kernel, I
did not expect a null page to be possible. Can you describe in the
commit message how such bad sges are created?

> 
> Reported-by: syzbot+b18872ea9631b5dcef3b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b18872ea9631b5dcef3b
> Fixes: 2bc793e3272a ("skmsg: Extract __tcp_bpf_recvmsg() and tcp_bpf_wait_data()")
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>

Does not apply to net. Please rebase and resend, adding the target tree
in the subj prefix and specifying a revision number.

Thanks,

Paolo

