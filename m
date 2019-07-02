From: willy@infradead.org (Matthew Wilcox)
Date: Tue, 2 Jul 2019 08:15:59 -0700
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH v5] Doc :
 fs : convert xfs.txt to ReST
In-Reply-To: <20190702123040.GA30111@localhost>
References: <20190702123040.GA30111@localhost>
Message-ID: <20190702151559.GE1729@bombadil.infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190702151559.pbV5TLIFfEbpbrdmV2VlF6wneWXa6YfMczaOLKncaXM@z>

On Tue, Jul 02, 2019 at 01:30:40PM +0100, Sheriff Esseson wrote:
> +++ b/Documentation/filesystems/index.rst
> @@ -40,4 +40,5 @@ Documentation for individual filesystem types can be found here.
>  .. toctree::
>     :maxdepth: 2
>  
> -   binderfs.rst
> +   binderfs
> +   xfs

I don't think this makes sense.  Look:

Kernel API documentation
------------------------
...
   filesystems/index

but the contents of xfs.rst are not kernel API documentation.  We have
precedent in Documentation/index.rst for:

Filesystem Documentation
------------------------

The documentation in this section are provided by specific filesystem
subprojects.

.. toctree::
   :maxdepth: 2

   filesystems/ext4/index

but that looks more like the xfs-delayed-logging-design.txt and
xfs-self-describing-metadata.txt files.

I think Documentation/filesystems/xfs.rst should be part of the
admin guide.  Furtnately, ext4 has again led the way here, and
Documentation/admin-guide/ext4.rst already exists.
