Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DFECE7A8A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Sep 2023 18:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5A160A99;
	Sun, 24 Sep 2023 18:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5A160A99
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ep28kp7t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwZdKqgjHSFD; Sun, 24 Sep 2023 18:47:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8353E60A91;
	Sun, 24 Sep 2023 18:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8353E60A91
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 566DDC0039;
	Sun, 24 Sep 2023 18:47:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76C11C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4450D60A92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4450D60A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6VgWzWpMgRY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D94F60A91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D94F60A91
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=BKloag/y3wObRwoHJ5YrsbKpoVh/LwWhJ9+J5Kji/kA=; b=Ep28kp7txgrei0cOh+31XEsElD
 Uzwgq+koccxwXa1ObQO23d5sYB4Mph+b1oeOUNSb2h6RnIjDZIzDvvd7uPk7xDuudb8zVlt6bKMq1
 DPKPtF06yTZoz5t7kgbR8zQJ8+eOjjD5zph9fkQM2VCSsisTEhUYdZasvccGWPNS9A6CZfaqZzqN/
 luTLjZ5FjgSdAPDsGzlMlGlod+KZZmZcqd0gVrqdQVT8rGiFU9j2rEFZhbW0zbiey7J12WBgUZMFD
 dEJRrFzEaWxHlmawN2s+VcEbRk7ce1rfJdw+FnlbMwiEFxa3IWyD2tfa1VWTl//5gKhkVFhGeMGU3
 krnWPfrQ==;
Received: from [2601:1c2:980:9ec0::9fed]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qkU8r-00Cbfy-1j; Sun, 24 Sep 2023 18:47:41 +0000
Message-ID: <5fd1b5cd-ea6c-44a1-9cb5-8f692d32ec99@infradead.org>
Date: Sun, 24 Sep 2023 11:47:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix Sphinx 8 warning caused by paths represented
 with strings
Content-Language: en-US
To: Claudio Cambra <developer@claudiocambra.com>, skhan@linuxfoundation.org,
 ivan.orlov0322@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20230924184057.91861-1-developer@claudiocambra.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230924184057.91861-1-developer@claudiocambra.com>
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

Hi,

On 9/24/23 11:40, Claudio Cambra wrote:
> Running "make htmldocs" generates several lines of this warning:
> 
> Documentation/sphinx/kerneldoc.py:141: RemovedInSphinx80Warning: Sphinx 8 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
>   doc = (env.srcdir + "/" + env.docname + ":" + str(self.lineno))
> 
> Making "doc" an fspath type and creating a new variable with the
> appended colon and lineno fixes this warning.
> 
> Signed-off-by: Claudio Cambra <developer@claudiocambra.com>
> ---
>  Documentation/sphinx/kerneldoc.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 9395892c7ba3..e2c835e10dba 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -138,7 +138,8 @@ class KernelDocDirective(Directive):
>                      lineoffset = int(match.group(1)) - 1
>                      # we must eat our comments since the upset the markup
>                  else:
> -                    doc = env.srcdir + "/" + env.docname + ":" + str(self.lineno)
> +                    doc = os.path.join(env.srcdir, env.docname)
> +                    doc_with_line = (doc + ":" + str(self.lineno))
>                      result.append(line, doc + ": " + filename, lineoffset)
>                      lineoffset += 1
>  

This patch should be sent to the linux-doc@vger.kernel.org mailing list,
with the Documentation maintainer copied on the patch.

We also have this similar patch to consider:
  https://lore.kernel.org/linux-doc/20230910040811.53046-1-erer1243@gmail.com/

Thanks.
-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
