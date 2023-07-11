Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F985EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Jul 2023 12:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC06E81D67;
	Tue, 11 Jul 2023 12:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC06E81D67
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=sanganaka@siddh.me header.a=rsa-sha256 header.s=zmail header.b=uB70xTuU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABe54IsBCdFb; Tue, 11 Jul 2023 12:54:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 403EE81C0A;
	Tue, 11 Jul 2023 12:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403EE81C0A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26FFAC0071;
	Tue, 11 Jul 2023 12:54:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00C4EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE373415D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 12:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE373415D3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=sanganaka@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=uB70xTuU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JtAzWntCwg6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 12:54:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A12E41498
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A12E41498
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 12:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1689080023; cv=none; d=zohomail.in; s=zohoarc; 
 b=EJILvpRVvbBJP9EAKQdK4E6JyyamRdFDq619/4Y5S8ziyojRdBkBghVyVZAOP7vG/sg8K2qkIbxy4plIwAAV3Qs+Lb0K3c5OADwfYRHuLy2aF2dRt1zAxGNn0Ttow7s+PnxDh0xM/QrhSlDnqOCA4WqpsLi17KBOgyBpkASwo4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1689080023;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=sDRZhfJtZM6SMeCjTiady4Zm+GK6pjYgzZcKKqyOVl8=; 
 b=KUNCdnGDnhnDdDvrr7DDzUrbM/O0W1OsOIfCgfr0dkYjOxFVrU8q/SW0xoEXbsEFBANi6faK8IH5fISnkkVGa1XOrXuQOmjmv0YnzaG0sSZz4rLDYS1juD5DFLmkbL+zv5Jw8if0rfg8p+2IHJiab4anpEKev39Q3gNStoi5jVM=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=sanganaka@siddh.me;
 dmarc=pass header.from=<sanganaka@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1689080023; 
 s=zmail; d=siddh.me; i=sanganaka@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=sDRZhfJtZM6SMeCjTiady4Zm+GK6pjYgzZcKKqyOVl8=;
 b=uB70xTuUcHRlZ4P8LGGK71KxvRCMAiqyPxJ6GchJewl0/SZPcaYz1K+kkMVmcBS/
 ffz5J1fhos3oDtk5aIVg4vcj5Ggu/ld1G9Ab5FyLi9yjNPB656gvMRfDgvWRNu9iGzx
 pCjKdPd6/WgPHzwDjrwwzqybFlCNKWxJatxrsGq8=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 168907999102016.22711675023993;
 Tue, 11 Jul 2023 18:23:11 +0530 (IST)
Date: Tue, 11 Jul 2023 18:23:10 +0530
From: Siddh Raman Pant <sanganaka@siddh.me>
To: "Anh Tuan Phan" <tuananhlfc@gmail.com>
Message-ID: <18945034ac9.b8dab3f468630.3272096982280629892@siddh.me>
In-Reply-To: <4bf6475b-6688-1b6d-0db1-b0f15d2e1b3d@gmail.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com>
 <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com>
 <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
 <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
 <1893b4bf70a.2c44c261262941.883099013045252156@siddh.me>
 <4bf6475b-6688-1b6d-0db1-b0f15d2e1b3d@gmail.com>
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: daniel <daniel@iogearbox.net>, "martin.lau" <martin.lau@linux.dev>,
 ast <ast@kernel.org>, andrii <andrii@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, bpf <bpf@vger.kernel.org>,
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

On Mon, 10 Jul 2023 18:33:23 +0530, Anh Tuan Phan wrote:
> Thank you! Will send a new version accordingly. But I'd like to admit
> that the v2 in this patch's title is a mistake. This should be v1 so
> I'll send a v2 patch for this discussion.

Well, I'd say you should still post a "v3", since inboxes of the
maintainers already have this email. Also, you posted two versions
of the patch here anyways, so v3 is correct.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
