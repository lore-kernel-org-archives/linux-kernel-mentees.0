Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4092DAFC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311431; cv=none; b=OB4ROKhU6tOOZGVrJkH4sDeHWwvmpuHoBDges0gS7q4XG7yhrjSS+CFmuoNcMj3Bhh0OgkfQKlgDdNDIfIbuKa3Xfm8XwH1tlKR7uUmqf7jSqnGNXuKR5c6LRKJ2Dwc59rOgSe48QNsQMbg4RnLTrG739XzMTjSZT/oC0WQ/w+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311431; c=relaxed/simple;
	bh=smJzPZ2H+puqNQpL9LTWdRgBhAS8OfsmNfjleezYjpM=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Tqglc133iN+F3Iphq2z6XA/YujJdEDsk40WaBzgbkSSfF1qyqwdhHVa/ZcwiT0I102sx9Rs/PiMwaFVXqcRhqJ+PZVUP9Lk0xfLgoYQ7flL3FGEB5hraZa0GV0kBB+i8/TtCNEsS3VxCOoGoJWp6EPZzAdFnAY+vjRn+om5TmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBEheL6G; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBEheL6G"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42CA40AC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4lsuDl-r4if for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 09:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E54740FCC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E54740FCC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IBEheL6G
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E54740FCC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759311427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00w3hkHfsTAxYQCvIOKAjdtuK2kAChIoMSa2X5uPZB0=;
	b=IBEheL6GT5Cy3Hax99z3hPEKEHY+YHpjZ7mrymj8nSEE7qoXOLb2Js8P1JN533oo55jKM9
	6wADp86740NQ4DCnMdAxilwDNwAJFSa96eiM0EA2uuly/RYKg6RGbvncPq8B8/pJ97xIp1
	iG+7OKPCf6SqvoCsaS6dMBEVEa0zynk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-ngBKf_HyMku4dc3tcFSEpA-1; Wed,
 01 Oct 2025 05:37:01 -0400
X-MC-Unique: ngBKf_HyMku4dc3tcFSEpA-1
X-Mimecast-MFC-AGG-ID: ngBKf_HyMku4dc3tcFSEpA_1759311419
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0BBC1800451;
	Wed,  1 Oct 2025 09:36:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 003CB30002C5;
	Wed,  1 Oct 2025 09:36:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251001083931.44528-1-bhanuseshukumar@gmail.com>
References: <20251001083931.44528-1-bhanuseshukumar@gmail.com>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: dhowells@redhat.com, Kent Overstreet <kent.overstreet@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>, Carlos Maiolino <cem@kernel.org>,
    Paulo Alcantara <pc@manguebit.org>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
    linux-bcachefs@vger.kernel.org, linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
    netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-kernel-mentees@lists.linuxfoundation.org,
    skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] fs: doc: Fix typos
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2077277.1759311412.1@warthog.procyon.org.uk>
Date: Wed, 01 Oct 2025 10:36:52 +0100
Message-ID: <2077278.1759311412@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com> wrote:

> Fix typos in doc comments
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>

Reviewed-by: David Howells <dhowells@redhat.com>

