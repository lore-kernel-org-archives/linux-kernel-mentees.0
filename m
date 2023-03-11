Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C57C61DA4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Mar 2023 05:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC364032E;
	Sat, 11 Mar 2023 05:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC364032E
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=UUpxXden
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QagQEJSxnM67; Sat, 11 Mar 2023 05:32:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 36990400D2;
	Sat, 11 Mar 2023 05:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36990400D2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E9A2C0071;
	Sat, 11 Mar 2023 05:32:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96A20C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 05:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AC656FA0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 05:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC656FA0A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=UUpxXden
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jK45BGsj1ZCv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 05:32:24 +0000 (UTC)
X-Greylist: delayed 00:15:09 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 753B96F9FC
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 753B96F9FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 05:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1678511826; cv=none; d=zohomail.in; s=zohoarc; 
 b=MAJxP/Y7VUsT1dmXNCicZJV93o5qJ8SDgA9HaeF2w7v9KKUMMdg/i+PQZQm1Q7L9GGTGRuBw2nk/NVFwWEuIAnBawoQNuUf6zXs+UeQlqew3SwY+25X8sJi8qFBJVLoEXg5wO4cOWgDmSIhOpDcyMnDd2pt/We22PaQPp4OVBnc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1678511826;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=654fJPoPkkA2Ofkz6DC3Gzmc98pclBqXOnVUTQHbzA0=; 
 b=GJFfUXgpRMqjveAbQW/lz0dr4Mi0CXy80LMyCXE7axJL3mmgtXGJik72b35VIQHOsZeAggF4rW9f6nUtXZg22GkyDZQxNz+7yqu+HnreM0wJOXLBwDaM+qlZ3mTN8L4ITz/8KNCFdG3ajiy6oPgMgos86znhG577qgQ+17/MZ0E=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678511826; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=654fJPoPkkA2Ofkz6DC3Gzmc98pclBqXOnVUTQHbzA0=;
 b=UUpxXdenkeKVtU8SYlGtn2SWUiFlo1ccTlbh5Kz61WbptrGqZy3S2WQTO1qxP1ij
 kwvlLTLm4W8FIqwy+/ZeQQOhXKgJUzPmv9e+PX2YzzRrkUfZ+g4Y7ll+ohWs7MUaCNM
 p9s1udkWTMfCFlxEqsUON/hPjCqk8i4+JNzZ0CRU=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1678511814182525.992911523984;
 Sat, 11 Mar 2023 10:46:54 +0530 (IST)
Date: Sat, 11 Mar 2023 10:46:54 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Ivan Orlov" <ivan.orlov0322@gmail.com>
Message-ID: <186cf19b619.4777c80c154603.5258165448157616593@siddh.me>
In-Reply-To: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
References: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: lucho <lucho@ionkov.net>, ericvh <ericvh@gmail.com>,
 asmadeus <asmadeus@codewreck.org>, linux_oss <linux_oss@crudebyte.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+cb1d16facb3cc90de5fb
 <syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com>,
 v9fs-developer <v9fs-developer@lists.sourceforge.net>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 11 Mar 2023 01:56:19 +0530, Ivan Orlov wrote:
> KASAN reported the following issue:
> [...]
> 
> Calling '__v9fs_get_acl' method in 'v9fs_get_acl' creates the
> following chain of function calls:
> 
> __v9fs_get_acl
>       v9fs_fid_get_acl
>               v9fs_fid_xattr_get
>                       p9_client_xattrwalk
> 
> Function p9_client_xattrwalk accepts a pointer to u64-typed
> variable attr_size and puts some u64 value into it. However,
> after the executing the p9_client_xattrwalk, in some circumstances
> we assign the value of u64-typed variable 'attr_size' to the
> variable 'retval', which we will return. However, the type of
> 'retval' is ssize_t, and if the value of attr_size is larger
> than SSIZE_MAX, we will face the signed type overflow. If the
> overflow occurs, the result of v9fs_fid_xattr_get may be
> negative, but not classified as an error. When we try to allocate
> an acl with 'broken' size we receive an error, but don't process
> it. When we try to free this acl, we face the 'wild-memory-access'
> error (because it wasn't allocated).
> 
> This patch will modify the condition in the 'v9fs_fid_xattr_get'
> function, so it will return an error if the 'attr_size' is larger
> than SSIZE_MAX.
> 
> Reported-by: syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=fbbef66d9e4d096242f3617de5d14d12705b4659
> Signed-off-by: Ivan Orlov ivan.orlov0322@gmail.com>

You should also test with Syzkaller if it gave a reproducer.
Check the following docs to know about it:
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches

> ---
>  fs/9p/xattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
> index 50f7f3f6b55e..d6f7450107a8 100644
> --- a/fs/9p/xattr.c
> +++ b/fs/9p/xattr.c
> @@ -35,7 +35,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const char *name,
>  		return retval;
>  	}
>  	if (attr_size > buffer_size) {
> -		if (!buffer_size) /* request to get the attr_size */
> +		if (!buffer_size && attr_size <= (u64) SSIZE_MAX) /* request to get the attr_size */
>  			retval = attr_size;
>  		else
>  			retval = -ERANGE;

You should use EOVERFLOW for overflow error. Make a new conditional
instead of using AND. Also, the explicit u64 cast for SSIZE_MAX can
be dropped for better readability.

Thanks,
Siddh

> -- 
> 2.34.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
