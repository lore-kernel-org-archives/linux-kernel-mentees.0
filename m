From: corbet@lwn.net (Jonathan Corbet)
Date: Fri, 28 Jun 2019 09:04:38 -0600
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH v2] Doc :
	doc-guide : Fix a typo
In-Reply-To: <20190628062001.26085-1-sheriffesseson@gmail.com>
References: <20190628060648.25151-1-sheriffesseson@gmail.com>
	<20190628062001.26085-1-sheriffesseson@gmail.com>
Message-ID: <20190628090438.017d70a7@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190628150438.hVF8EU_YHjSyCaMXCAhf9q7DzcoDIzwdMH-fRWqHreM@z>

On Fri, 28 Jun 2019 07:20:01 +0100
Sheriff Esseson <sheriffesseson at gmail.com> wrote:

> fix the disjunction by replacing "of" with "or".
> 
> Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
> ---
> 
> changes in v2:
> - cc-ed Corbet.
> 
>  Documentation/doc-guide/kernel-doc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> index f96059767..192c36af3 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -359,7 +359,7 @@ Domain`_ references.
>    ``monospaced font``.
>  
>    Useful if you need to use special characters that would otherwise have some
> -  meaning either by kernel-doc script of by reStructuredText.
> +  meaning either by kernel-doc script or by reStructuredText.
>  
>    This is particularly useful if you need to use things like ``%ph`` inside
>    a function description.

I have applied this, thanks.

jon
